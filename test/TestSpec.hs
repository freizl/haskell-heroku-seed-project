{-# LANGUAGE OverloadedStrings #-}

-- |
module TestSpec where

import qualified Data.Text as T
import Test.Hspec hiding (pending)

spec :: Spec
spec = do
  describe "Test" $ do
    it "test" $ do
      True `shouldBe` True
