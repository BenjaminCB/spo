module TopicZero where

class Node a where
    children :: a -> [a]

data Expr = Lit Int
          | Var String
          | Times Expr Expr
          | Plus Expr Expr
          deriving (Eq)

instance Node Expr where
    children (Times t1 t2) = [t1, t2]
    children (Plus t1 t2) = [t1, t2]
    children _ = []

instance Show Expr where
    show (Lit n) = show n
    show (Var str) = str
    show (Times t1 t2) = "(" ++ show t1 ++ " * " ++ show t2 ++ ")"
    show (Plus t1 t2) = "(" ++ show t1 ++ " + " ++ show t2 ++ ")"

testExpr :: Expr
testExpr = Times (Plus (Var "a") (Var "n")) (Lit 1)
