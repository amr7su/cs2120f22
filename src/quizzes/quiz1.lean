/-
CS2120 Fall 2022 Sullivan. Quiz #1. Edit your answers into
this file using VSCode. Save the file to your *local* hard 
drive (File > Save As > local > ...). Submit it to the Quiz1
assignment on Collab.
-/

/-
#1: For each of the following questions give a yes/no answer 
and then a very brief explanation why that answer is correct.
To explain why your answer is correct, name the specific rule
of inference that tells you it's correct, or explain that 
there is no such valid inference rule.
-/

/-
#1A

If a ball, b, is round *and* b is also red, is b red?

A: yes/no: 
Yes
B: Why? 
and elimination right

#1B

If flowers make you happy and chocolates make you happy,
and I give you flowers *or* I give you chocolates, will
you be happy?

A: yes/no: 
Yes
B: Why?
or elimination

#1C: If giraffes are just zebras in disguise, then the 
moon is made of green cheese?

A. yes/: 
yes
B. Why?
false elimination (i.e., from the proof of false "giraffes are just zebras in disguise",
we may derive a proof of any other proposition)

#1D. If x = y implies that 0 = 1, then is it true that
x ≠ y?

A. yes/no: 
yes
B. Why?
not definition (not X <-> (X -> false))
in this case, (x=y) -> false, so not (x=y), which is equivalent to (x ≠ y)


#1E. If every zebra has stripes and Zoe is a Zebra then
Zoe has stripes.

A. yes/no: 
yes
B. Why?
all elimination

#1F. If Z could be *any* Zebra and Z has stripes, then 
*every* Zebra has stripes.

A. Yes/no: 
no
B: Why?
there is no valid inference rule which states that if some particular x in X, Y then X -> Y

#1G. If whenever the wind blows, the leaves move, and 
the leaves are moving, then the wind is blowing.

A. yes/no: 
no
B. Why? 
the converse is not a valid inference rule, for instance (X -> Y) implies (Y -> X)
is not true when X is false and Y is true (false implies true but true does not imply false)

#1H: If Gina is nice *or* Gina is tall, and Gina is nice,
then Gina is not tall. (The "or" here is understood to be
the or of predicate logic.)

A. yes/no: 
no
B. Why?
the disjunct is not valid for logical OR, for example (X OR Y) -> NOT Y
is false when Y and X are true, as OR evaluates to true when both arguments are true
-/



/- 
#2

Consider the following formula/proposition in propositional
logic: X ∨ ¬Y.

#2A: Is is satisfiable? If so, give a model (a binding of 
the variables to values that makes the expressions true).
Yes it is satisfiable, a model which satisfies it is X = true, Y = true

#2B: Is it valid? Explain your answer. 
It is not valid because it is not true for every X and Y, for instance X = false, Y = true
makes the expression evaluate to false (false OR not true = false OR false = false)

-/


/-
#3: 

Express the following propositions in predicate logic, by
filling in the blank after the #check command.

If P and Q are arbitrary (any) propositions, then if (P is 
true if and only if Q is true) then if P is true then Q is 
true.
-/

#check (∀ (P Q : Prop), (P ↔ Q) → (P → Q))



/-
#4 Translate the following expressions into English.
The #check commands are just Lean commands and can
be ignored here. 
-/


-- A
#check ∀ (n m : ℕ), n < m → m - n > 0

/-
Answer:
for all natural numbers n, m, n being less than m implies that m minus n is greater than 0
-/

-- B

#check ∃ (n : ℕ), ∀ (m : nat), m >= n

/-
Answer:
there exists some natural number n such that for all natural numbers m, m is greater than n
-/


-- C

variables (isEven: ℕ → Prop) (isOdd: ℕ → Prop)
#check ∀ (n : ℕ), isEven n ∨ isOdd n

/-
Answer:
for ever natural number n, n is even or n is odd
-/


-- D

#check ∀ (P : Prop), P ∨ ¬P

/-
Answer:
for any arbitrary proposition P, either P is true or NOT P is true
-/


-- E

#check ∀ (P : Prop), ¬(P ∧ ¬P)

/-
Answer:
for any arbitrary proposition P, it is not true that both P is true and NOT P is true
-/


/-
#5 Extra Credit

Next we define contagion as a proof of a slightly long
proposition. Everything before the comma introduces new
terms, which are then used after the comma to state the
main content of the proposition. 

Using the names we've given to the variables to infer
real-world meanings, state what the logic means in plain
natural English. Please don't just give a verbatim reading
of the formal logic. 
-/

variable contagion : 
  ∀ (Animal : Type) 
  (hasVirus : Animal → Prop) 
  (a1 a2 : Animal) 
  (hasVirus : Animal → Prop)
  (closeContact : Animal → Animal → Prop), 
  hasVirus a1 → closeContact a1 a2 → hasVirus a2

--for any two animals a1 and a2, regardless of species, if a1 has a virus and comes into
--close contact with a2, then a2 also has a virus


