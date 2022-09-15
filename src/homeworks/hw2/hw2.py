# Be sure you've done pip install z3-solver
from telnetlib import X3PAD
from z3 import *

def isValid(prop, name):
    
    
    # Create z3 variable(s) representing the unknown
    # Here, the unknown, x, is the square root of n.
    s = Solver()
    
    s.add(Not(prop))
    # I believe it's not valid
  
    r = s.check()
    
    # If there's a model/solution return it 
    if (r == unsat):
        print(name + " is valid")
    # otherwise return inconsistent value for error
    else :
        print(name + " is invalid, here's a counter-example: ", s.model() )
        
X, Y, Z = Bools("X Y Z")

#rule 1
C1 = Implies(And(Or(X,Y), X), Not(Y))
#if either x or y is true, and x is true, then y must not be true
#i believe this is not valid
isValid(C1, "C1")
#i can have a coffee or read a book. if i have a coffee, i can still read a book

#rule 2
C2 = Implies(And(X,Y),And(X,Y))
#if x is true and y is true, then x and y must both be true
#i believe this is valid
isValid(C2, "C2")

#rule 3
C3 = Implies(And(X,Y),X)
#if x and y are both true, then x must be true
#i believe this is valid
isValid(C3, "C3")

#rule 4
C4 = Implies(And(X,Y),Y)
#if x and y are both true, then y must be true
#i believe this is valid
isValid(C4, "C4")

#rule 5
C5 = Implies(Not(Not(X)), X)
#if not x is not true, then x must be true
#i believe this is valid
isValid(C5, "C5")

#rule 6
C6 = Not(And(X, Not(X)))
#it is not true that both x is true and not x is true
#i believe this is valid
isValid(C6, "C6")

#rule 7
C7 = Implies(X,Or(X,Y))
#if x is true, then x or y is true
#i believe this is valid
isValid(C7, "C7")

#rule 8
C8 = Implies(Y,Or(X,Y))
#if y is true, then x or y is true
#i believe this is valid
isValid(C8, "C8")

#rule 9
C9 = Implies(And(Implies(X, Y), Not(X)), Not(Y))
#if x implies y and x is not true, then y is not true
#i believe this is not valid
isValid(C9, "C9")
#the sky being green implies that apples are red, but the sky not being green does not imply that apples are not red

#rule 10
C10 = Implies(And(Implies(X, Y),Implies(Y, X)),X == Y)
#if X implies Y and Y implies X, then X is true if and only if Y is true
#i believe this is valid
isValid(C10, "C10")

#rule 11
C11 = Implies(X == Y, Implies(X, Y))
#if x is true if and only if y is true, then x implies y
#i believe this is valid
isValid(C11, "C11")

#rule 12
C12 = Implies(X == Y, Implies(Y, X))
#if x is true if and only if y is true, then y implies x
#i believe this is valid
isValid(C12, "C12")

#rule 13
C13 = Implies(And(And(Or(X, Y), Implies(X, Z)),Implies(Y, Z)),Z)
#if X or Y is true, and both X and Y independently imply Z, then Z must be true
#i believe this is valid
isValid(C13, "C13")

#rule 14
C14 = Implies(And(Implies(X, Y), Y), X)
#if x implies y and y is true, then x is true
#i believe this is not valid
isValid(C14, "C14")
#the sky being green implies that apples are red, and apples are red, but that does not imply that the sky is green

#rule 15
C15 = Implies(And(Implies(X,Y),X),Y)
#if x implies y and x is true, then y is true
#i believe this is valid
isValid(C15, "C15")

#rule 16
C16 = Implies(And(Implies(X, Y), Implies(Y, Z)),Implies(X, Z))
#if x implies y and y implies z, then x implies z
#i believe this is valid
isValid(C16, "C16")

#rule 17
C17 = Implies(Implies(X, Y), Implies(Y, X))
#if x implies y, then y implies x
#i believe this is not valid
isValid(C17, "C17")
#the sky being green implies that apples are red, but apples being red does not imply that the sky is green

#rule 18
C18 = Implies(Implies(X, Y), Implies(Not(Y),Not(X)))
#if x implies y, then not y implies not x
#i believe this is valid
isValid(C18, "C18")

#rule 19
C19 = Not(Or(X, Y)) == And(Not(X), Not(Y))
#if x or y is not true, then x is not true and y is not true
#i believe this is valid
isValid(C19, "C19")

#rule 20
C20 = Not(And(X, Y)) == Or(Not(X), Not(Y))
#if x and y is not true, then x is not true or y is not true
#i believe this is valid
isValid(C20, "C20")