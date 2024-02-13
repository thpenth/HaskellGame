module Main where

-- Define the binary tree data structure for the game
data BinaryTree = DecisionNode String BinaryTree BinaryTree
                | EndingNode String

-- Populate the game tree with decisions and endings
gameTree :: BinaryTree
gameTree = DecisionNode "Somehow, you find yourself walking towards the end of a dimly lit sidewalk somewhere in the downtown district of Haskellopolis. On your left is a dark alley and on your right is an abandoned building. Which way do you go?"
            (DecisionNode "As you get your bearings in the alley, an anonymous function in a trench coat approaches you. Do you run away (left) or find out what it wants (right)?"
                (DecisionNode "As you run away, you see a book on the gorund. It appears to be 'Verified Functional Programming in Agda' by Aaron Stump. Do you stop to pick it up (left) or keep running (right)?"
                    (EndingNode "You try to pick the book up, but fall and sprain your ankle. You are doomed to spend the rest of your days reading the textbook :(")
                    (EndingNode "You successfully escape the joys of programming in Haskell. You win!"))
                (DecisionNode "As the function approaches you, it asks a riddle: What is the value of order([Char -> Char] -> Char)? Is it 1 (left) or 2 (right)?"
                    (EndingNode "A loud incorrect buzzer sounds.... You lose!")
                    (EndingNode "A loud correct buzzer sounds and suddenly you understand all of Haskell perfectly. You win!")))
            (DecisionNode "You notice the front door of the building open as you approach. Do you enter through the front door (left) or a window (right)?"
                (DecisionNode "You cautiously enter through the front door. Inside, you find a group of programmers discussing the latest functional programming trends. They notice you and ask you a question to initiate you into their society: Finish the statement map :: (a -> b) ->... Is it (a -> b) [left] or ([a] -> [b]) [right] "
                    (EndingNode "You answer confidently... but incorrectly. The programmers begin some sort of ritual and everything goes black. You lose!")
                    (EndingNode "You answered correctly! You get to spend the rest of your life coding in Haskell with your newfound freinds! You win!"))
                (DecisionNode "As you climb through the window, you discover a variety of ancient coding relics. You see a small black box on a shelf and a large suspicious treasure chest in the middle of the room. Do you choose the box (left) or the chest( right) "
                    (EndingNode "In the box is a hidden stash of bitcoins! You're unbelievably wealthy and can spend the rest of your days on Haskell beach. You win!")
                    (EndingNode "Oh no! The chest had a compiler error in it! Suddenly nothing makes sense and your reality is a lie. You lose! ")))


-- Gameplay function to navigate the tree based on user choices
playGame :: BinaryTree -> IO ()
playGame (EndingNode story) = putStrLn story
playGame (DecisionNode question left right) = do
    putStrLn question
    putStrLn "Choose: left or right"
    choice <- getLine
    case choice of
        "left" -> playGame left
        "right" -> playGame right
        _ -> putStrLn "Invalid choice. Try again." >> playGame (DecisionNode question left right)

-- Main function to start the game
main :: IO ()
main = playGame gameTree
