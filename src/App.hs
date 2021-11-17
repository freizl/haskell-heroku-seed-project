{-# LANGUAGE OverloadedStrings #-}

module App (main) where

import Data.Maybe
import Text.Read (readMaybe)
import qualified Web.Scotty as Scotty
import Lucid.Html5
import Lucid
import System.Environment (lookupEnv)

--------------------------------------------------

-- * Handlers

--------------------------------------------------

renderHomeH :: Scotty.ActionM ()
renderHomeH = do
  Scotty.html . renderText $
    html_ $
      body_ $ do
        h1_ "Title"
        p_ "Hello World, dockerfile!"

--------------------------------------------------

-- * Routes

--------------------------------------------------
routes :: Scotty.ScottyM ()
routes = do
  Scotty.get "/" renderHomeH

--------------------------------------------------

-- * Main App

--------------------------------------------------
main :: IO ()
main = do
  port <- getPort <$> lookupEnv "PORT"
  Scotty.scotty port routes

getPort :: Maybe String -> Int
getPort port = do
  case port of
    Just pStr -> fromMaybe defaultPort (readMaybe pStr)
    Nothing -> defaultPort

defaultPort :: Int
defaultPort = 3000
