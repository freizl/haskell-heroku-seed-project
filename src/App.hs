{-# LANGUAGE OverloadedStrings #-}

module App (main) where

import Data.Maybe
import System.Environment (lookupEnv)
import Text.Read (readMaybe)
import qualified Web.Scotty as Scotty

--------------------------------------------------

-- * Handlers

--------------------------------------------------

renderHomeH :: Scotty.ActionM ()
renderHomeH = Scotty.html "Hello heroku in Haskell!"

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
