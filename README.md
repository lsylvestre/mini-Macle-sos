# mini-Macle-sos

Experimental interpreter for a Macle Core language mixing synchronous and functionnal-imperative programming *à la OCaml*.

To use it, do for instance :
```
$ make
$ ./interp exemples/sum_i.mcl
i=1     |o=nil  |
--------------------------------
1       | 1     | 
2       | 3     | 
5       | 8     | 
13      | 21    | 
34      | 55    | 
89      | 144   | 
233     | 377   | 
610     | 987   | 
1597    | 2584  | 
4181    | 6765  | 
10946   | 17711 | 
$ make clean
```

Here the syntax of the language : 
```
; program
pi ::= d pi
     | e

; declaration
d ::= input x
    | outupt x
    | let x = v

; expression
e ::= a 
    | if a then e1 else e2
    | let rec t1 and ... tn in e
    | let x1 = e1 and x2 = e2 in e
    | v a1 ... an
    | immediate f a1 ... an
    | do (next x) = a then e
    | local <x/x'> = c in e
    | raise X
    | try e with X -> e'
    | abort e when a

; atom
a ::= v
    | ?a         // read an input
    | ~o         // read the current value of an output
    | a1 op2 a2
    | not a
    | if a1 then a2 else a3

op2 ::= + | - | * | <= | == | && | or

; value
v ::= c
    | x
    | fun x -> e
```

The physical environment (inputs/outputs) must be specified in a file with the same path that the Macle programme (.mcl) but with the extension ".obs" (i.e. observer).

The syntax of the observer program is :

```
obs ::= d1 ... dn

d ::= output o
    | input c
    | input c -> a   // where `a` is a Macle atom
```



