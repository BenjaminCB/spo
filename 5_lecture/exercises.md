# Exercise Session 5
## Exercise 2
### a
is ambiguous

aaab can be parsed differently

### b
Is unambiguous you only ever create a single new non-terminal.

### c
This is probably ambiguous seeing as A and B can create the same terminals.

### d
Unambiguous you only ever create a single new non-terminal

## Exercise 3
```
S -> Number
Number -> [Sign] [Digs period] Digs
Sign -> plus
      | minus
Digs -> digit [digit]

N1 -> Sign
    | EMPTY

N2 -> Digts period
    | EMPTY

D1 -> digit
    | EMPTY

Number -> N1 N2 Digs
Sign -> plus
      | minus
Digs -> digit D1
```

```
Prog -> Dcls Stmts $
Dcls -----> Dcl Dcls
          | EMPTY
Dcl ------> floatdcl id
          | intdcl id
Stmts ----> Stmt Stmts
          | EMPTY
Stmt -----> id assign Val ExprTail
          | print id
ExprTail -> plus Val ExprTail
          | minus Val ExprTail
          | EMPTY
Val ------> id
          | num
```

$Ficst(Prog) = \{First(Dcls)\}$

$First(Dcls) = \{First(Dcl), EMPTY\}$

$First(Dcl) = \{floatdcl, intdcl\}$

$First(Stmts) = \{first(Stmt), EMPTY\}$

$first(Stmt) = \{id, print\}$

$first(ExprTail) = \{plus, minus, EMPTY\}$

$first(Val) = \{id, num\}$

$follow(Prog) = \empty$

$follow(Dcls) = \{\$,first(Stmts)\}$

$follow(Dcl) = \{first(Dcl), follow(Dcls)\}$

$follow(Stmts) = \{\$\}$

$follow(Stmt) = \{first(Stmt), follow(Stmts)\}$

$follow(ExprTail) = \{follow(Stmt)\}$

$follow(Val) = \{first(ExprTail), follow(ExprTail)\}$
