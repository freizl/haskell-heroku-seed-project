{-# LANGUAGE OverloadedStrings #-}

-- |
module TestSpec where

import Test.Hspec hiding (pending)

spec :: Spec
spec = do
  describe "Test" $ do
    it "test" $ do
      True `shouldBe` True
