module AC where

import Data.List

data Prog = Prog Dcls Stmts EOL

data EOL = EOL

data Dcls = Dcls Dcl Dcls
          | DclsEmpty

data Dcl = FloatDcl Char
         | IntDcl Char

data Stmts = Stmts Stmt Stmts
           | StmtsEmpty

data Stmt = Stmt Char Val Expr
          | Print Char

data Expr = Plus Val Expr
          | Minus Val Expr
          | ExprEmpty

data Val = Val Char
         | Inum Int
         | Fnum Double

data Token = TFloatDcl
           | TIntDcl
           | TPrint
           | TId Char
           | TAssign
           | TPlus
           | TMinus
           | TInum Int
           | TFnum Double
           | TBlank
           | TEmpty
           deriving (Eq, Show)

scanner :: String -> Token
scanner [] = TEmpty
scanner (c:str) | c == ' ' = scanner str
                | c `elem` ['0'..'9'] = scanDigits (c:str)
                | c `elem` ['a'..'z'] \\ ['i','f','p'] = TId c
                | otherwise = case c of
                  'f' -> TFloatDcl
                  'i' -> TIntDcl
                  'p' -> TPrint
                  '=' -> TAssign
                  '+' -> TPlus
                  '-' -> TMinus
                  _   -> error "not a valid token"

scanDigits :: String -> Token
scanDigits str = _scanDigits $ takeWhile (\c -> c `elem` '.' : ['0'..'9']) str
  where
    _scanDigits num
      | dotLength == 0 = TInum (read num)
      | dotLength == 1 = TFnum (read num)
      | otherwise      = error "too many dots in the same symbol"
      where
        dotLength = length $ filter (=='.') num

