# Exercise Session 7
## Exercise 1
a should be LL(1)

b is not because a, we do not know where the first b comes from.

c cannot distinguish between the b's.

d should be valid as the all have unique first symbols and are left recursive.

## Exercise 2
$First(Start) = First(Value)$

$First(Value) = \{num, lparen\}$

$First(Expr) = \{plus, prod\}$

$First(Values) = \{First(Value), Follow(Value)\}$

$Follow(Value) = \{$, First(Value), rparen\}$

$Follow(Expr) = \{rparen\}$

$Follow(Values) = \{rparen\}$

## Exercise 5
```
DeclList -> DeclList ; Decl
          | Decl

Decl -> idList ; Type

idList -> idList,id
        | id

Type -> ScalarType
      | array ( ScalarTypeList ) of Type

ScalarType -> id
            | Bound .. Bound

Bound -> Sign intconstant
       | id

Sign -> +
      | -
      | EMPTY

ScalarTypeList -> ScalarTypeList,ScalarType
                | ScalarType
```

## Exercise 9
```
stmt (ID:SEMICOLON:ts) = ()
stmt (ID:LPAREN:ts) = do
    idList ts
    return ()
idList (ID:COMMA:ts) do
    idList ts
    return ()
idList (ID:ts) = ()
```

## Exercise 10

