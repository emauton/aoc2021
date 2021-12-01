import Test.Hspec
import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "day 1 countIncreases" $ do
    it "works on AoC example" $ do
      countIncreases [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] `shouldBe` (7 :: Int)
