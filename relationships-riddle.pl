% Given a set of database facts, write a Prolog
% program capable of answering relationship
% queries between two individuals.
%
% Ex: female(X) should return either True or False
% depending on whether X is a woman.

id(disney, 1).
id(donaldduck, 2).
id(mickeymouse, 3).
id(minniemouse, 4).
id(daisyduck, 5).
id(nemo, 6).
id(minto, 7).
id(morley, 8).
id(morty, 9).
id(maisie, 10).
id(goofy, 11).

male(disney).
male(donaldduck).
male(mickeymouse).
male(minto).
male(morley).
male(goofy).

female(morty).
female(maisie).
female(minniemouse).
female(nemo).
female(daisyduck).

father(disney, mickeymouse).
father(disney, donaldduck).

father(mickeymouse, minto).
father(mickeymouse, morley).
father(mickeymouse, morty).
father(mickeymouse, maisie).

father(donaldduck, goofy).

wife(minniemouse, mickeymouse).
wife(nemo, goofy).
wife(daisyduck, donaldduck).

mother(X, Y) :- female(X), male(Z), wife(X, Z), father(Z, Y).
brother(X, Y) :- male(X), male(Y), father(Z, X), father(Z, Y), not(X = Y), id(X, A), id(Y, B), A < B.
grandson(X, Y) :- male(X), father(Z, X), father(Y, Z).
grandaughter(X, Y) :- female(X), father(Z, X), father(Y, Z).
uncle(X, Y) :- male(X), brother(X, Z), father(Z, Y).
aunty(X, Y) :- female(X), wife(X, Z), uncle(Z, Y).
parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).
cousin(X, Y) :- parent(A, X), parent(B, Y), parent(C, A), parent(C, B), not(A = B), id(X, M), id(Y, N), M < N.