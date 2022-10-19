/-
CS 2120 F22 Homework #4. Due Oct 13.
-/

/- #1A [10 points]

Write a formal proposition stating that 
logical and (∧) is associative. That is, 
for arbitrary propositions, P, Q, and R,
P ∧ (Q ∧ R) is true *iff* (P ∧ Q) ∧ R is, 
too. Replace the placeholder (_) with your
answer.
-/

def and_associative : Prop := 
  ∀ (P Q R : Prop),
    P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R


/- #1B [10 points]

Give an English language proof. Identify
the inference rules of predicate logic
that you use in your reasoning.
-/

/-
Answer: According to the intro rule for iff, it suffices to prove both
directions of the proposition separately. Left to right, we have that
P AND (Q AND R) implies (P AND Q) AND R. Applying and elimination twice to (Q AND R)
gives us, separately, P, Q, and R. Then we apply and introduction to P and Q, and then
again to (P AND Q) and R to yield (P AND Q) AND R.
The same logic is used in proving the right to left proposition,
applying and elimination twice to (P AND Q) and then and introduction to Q and R
and then to P and (Q AND R) to yield P AND (Q AND R).
-/

/- #1C [5 points]

Give a formal proof of the proposition.
Hint: unfold and_associative to start.
-/

theorem and_assoc_true : and_associative :=
begin
end



/- #2A [10 points]

Write the proposition that ∨ is associative.,
analogous to the proposition about ∧ in #1.
-/

def or_associative : Prop := 
  ∀ (P Q R : Prop),
    P ∨ (Q ∨ R) ↔ (P ∨ Q) ∨ R

/- #2B [10 points]

Write an English language proof of it, citing
the specific inference rules you use in your
reasoning.

According to the intro rule for iff, it suffices to prove both
directions of the proposition separately. Left to right, we have that
P OR (Q OR R) implies (P OR Q) OR R. In the case that P is true, then (P OR Q) must
be true by or introduction, and thus (P OR Q) OR R must be true by introduction again.
In the case that (Q OR R) is true, then at least one of Q or R is true. In the case that
Q is true, then (P OR Q) is true by or introduction, and (P OR Q) OR R is also true by or introduction.
In the case that R is true, (P OR Q) OR R is true by or introduction. In the case that
P Q and R are false, the proposition need not be proven because false implies true.
Thus the proposition holds in all cases and is true.
The same logic is used in proving the right to left proposition,
checking each case and applying or introduciton to the appropriate members to
contstruct the desired expression.
-/


/- #2C [5 points]

Complete the following formal proof.
-/

theorem or_associative_true : or_associative :=
begin
end


/- #3A [10 points]
Write a formal statement of the proposition.
-/

def arrow_transitive : Prop :=
  ∀ (P Q R : Prop),
    (P → Q) → (Q → R) → (P → R)


/- #3B [10 points]

Write an English language proof of the proposition
that for any propositions, X, Y, and X, it's the
case that (X → Y) → (Y → Z) → (X → Z). In other
words, implication is "transitive." Hint: Recall
that if you have a proof of, say, X → Y, and you 
have a proof of X, you can derive a proof of Y by
arrow elimination. Think of it as applying a proof
of an implication to a proof of its premise to get
yourself a proof of its conclusion.

Answer: Assume that X is true. Then, by arrow elimination on X → Y,
Y must be true. Then arrow elimination on (Y → Z) gives us that Z is true.
-/


/- #3C [5 points]. 
Write a formal proof of it.
-/
theorem arrow_trans_true : arrow_transitive :=
begin
end


/- #4
Suppose that if it's raining then the streets
are wet. This problem requires you to prove that
if the streets are not wet then it's not raining.
-/

/- #4A [10 points]

Start by writing the proposition in predicate
logic by completing the following answer.
-/

def contrapositive : Prop :=
  ∀ (Raining Wet : Prop), 
    (Raining → Wet) → (¬Wet → ¬Raining)


/- #4B [10 points]. 
-/

theorem contrapositive_valid : contrapositive :=
begin
assume h1: Raining,
assume h : Raining → Wet,

end

/- #4C [5 points]. 

Give an English language proof of it.

If raining implies that it is wet, assume that it is raining and it is not wet. Now apply
arrow elimination to (Raining implies Wet) to derive a proof that it is wet. Now we have
that it is wet and it is not wet, and absurdity. Thus it is not possible that it is
raining when it is not wet.
-/


/- #5. Extra credit.

Complete the following formal proof of the 
proposition that if for any proposition P, 
P ∨ ¬P is true, then for any propositions, 
X and Y, if it's not the case that X or Y
is true then it is the case that ¬X and ¬Y 
is true. 
-/

theorem demorgan1 : 
  (∀ (P : Prop), P ∨ ¬ P) → 
    ∀ (X Y : Prop), 
      ¬(X ∨ Y) → (¬X ∧ ¬Y) :=
begin
assume em X Y nxory,
cases (em X) with x nx, 
let foo := or.intro_left Y x,

end

/-
A comment on or.intro_left and or.intro_right.
In Lean each of these takes two arguments: a
proof of the disjunct -- the proposition on 
one side of the ∨ -- that is to be proven true, 
*and* it takes as an argument the proposition 
that is not being proven true. In applications 
of these rules the proposition argument (not 
being proven) comes first, while the proof 
argument comes second.

The reason is that Lean needs to know what 
overall proposition is being proved. From the
proof argument it can infer the proposition 
being proved, but it needs the other proposition
as well to know the full (X ∨ Y) disjunction to
be proved. 

Here's an example:
-/

example : 0 = 0 ∨ 0 = 1 :=
begin
apply or.intro_left (0 = 1) rfl
/-
The "rfl" serves as a proof of 0=0.
But in addition, as the first argument
to or.intro, we need to provide the
*proposition* that is not being proved.
Here's that's (0 = 1). In contexts
where Lean can infer both disuncts,
you can use the simpler or.inl or 
or.inr, each of which just takes one
argument: a proof of the left or of 
the right side, respectively.
-/
end

