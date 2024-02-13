module Main where

-- Define the binary tree data structure for the game
data BinaryTree = DecisionNode String BinaryTree BinaryTree
                | EndingNode String

-- Populate the game tree with decisions and endings
gameTree :: BinaryTree
gameTree = DecisionNode "You are in a dark forest. Do you go left or right?"
            (DecisionNode "You find a mysterious cave. Enter or go back?"
                (EndingNode "You discovered a treasure! You win!")
                (EndingNode "A bear appears and you decide to run away. Safe, but no treasure."))
            (DecisionNode "You come across a river. Do you swim across or follow along the bank?"
                (EndingNode "You found a boat and safely cross the river. You find a village and celebrate with the villagers.")
                (EndingNode "You get lost and end up back where you started. It's getting dark."))

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
