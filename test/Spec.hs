import Test.Hspec
import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day 1 countIncreases" $ do
    it "works on AoC example" $ do
      countIncreases [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] `shouldBe` (7 :: Int)
  describe "day 1 sumWindows" $ do
    it "works on AoC example" $ do
      sumWindows [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] `shouldBe` [607, 618, 618, 617, 647, 716, 769, 792]
