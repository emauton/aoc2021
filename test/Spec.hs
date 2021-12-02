import Test.Hspec
import Data.Text
import Day1
import Day2

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
  describe "day 2 makeMove" $ do
    it "works on my example" $ do
      makeMove (0, 0) [(pack "forward"), (pack "8")] `shouldBe` (8, 0)
  describe "day 2 parseDirections" $ do
    it "works on AoC example" $ do
      finalPosition [[(pack "forward"), (pack "5")],[(pack "down"), (pack "5")],[(pack "forward"), (pack "8")],[(pack "up"), (pack "3")],[(pack "down"), (pack "8")],[(pack "forward"), (pack "2")]] `shouldBe` (15, 10)
