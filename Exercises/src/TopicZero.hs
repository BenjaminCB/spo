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

readExprIO :: IO Expr
readExprIO = do
    expr <- getLine
    let ts = words expr
    return $ parseStrs ts

readExpr :: String -> Expr
readExpr = parseStrs . words

-- | Does not actually take into account into account the order of operations
-- | Just parses from left to right
parseStrs :: [String] -> Expr
parseStrs [x] = case safeRead x of
                Just n -> Lit n
                Nothing -> Var x
parseStrs (x:"+":xs) = Plus (parseStrs [x]) (parseStrs xs)
parseStrs (x:"*":xs) = Times (parseStrs [x]) (parseStrs xs)
parseStrs _ = undefined

-- | from hoogle
safeRead :: Read a => String -> Maybe a
safeRead s
  | [(x, "")] <- reads s = Just x
  | otherwise = Nothing

testExpr :: Expr
testExpr = Times (Plus (Var "a") (Var "n")) (Lit 1)
