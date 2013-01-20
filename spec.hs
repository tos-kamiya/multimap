import Test.Hspec
import Test.HUnit

import Data.Map as M
import MultiMapWrapper as MM

main = hspec mySpecs

mySpecs = describe "MultiMapBuilder" $ do
  it "builds a multi-map from a list of (key, value)" $ do
    let a = MM.fromList [(2, 2), (3, 3), (2, 4), (5, 5), (2, 6)]
    let e = M.fromList [(2, [2, 4, 6]), (3, [3]), (5, [5])]
    a `shouldBe` e

  it "reverts a multi-map to a list of (key, value)" $ do
    let a = MM.toList $ MM.fromList [(2, 2), (3, 3), (2, 4), (5, 5), (2, 6)]
    let e = [(2,2),(2,4),(2,6),(3,3),(5,5)]
    a `shouldBe` e

  it "lookup values in a multi-map" $ do
    let mm = MM.fromList [(2, 2), (3, 3), (2, 4), (5, 5), (2, 6)]
    (lookupList 2 mm) `shouldBe` [2, 4, 6]
    (lookupList 999 mm) `shouldBe` []
    
