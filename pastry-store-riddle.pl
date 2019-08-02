% Given a set of pastry stores and facts about them
% 1. Write a Prolog predicate that is true if store X has 4
% or more pastries on its menu.
% 2. Write a Prolog predicate `exists(x)` that returns true
% if there exists a store that sells x kind of pastry.

store(chai_coffee_company, [nike, nica, seth], 
	[ pastry(berry, [orange, blueberry, strawberry], 2), 
	pastry(tropical, [orange, banana, mango, guava], 3), 
	pastry(blue, [banana, blueberry], 3) ]).

store(bits_and_bytes, [coet,dos], 
	[ pastry(pinacolada, [orange, pineapple, coconut], 2), 
	pastry(green, [orange, banana, kiwi], 5), 
	pastry(purple, [orange, blueberry, strawberry], 2), 
	pastry(smooth, [orange, banana, mango],1) ]).

store(yumpys, [arvin,vino,kart], 
	[ pastry(combo1, [strawberry, orange, banana], 2), 
	pastry(combo2, [banana, orange], 5), 
	pastry(combo3, [orange, peach, banana], 2), 
	pastry(combo4, [guava, mango, papaya, orange],1), 
	pastry(combo5, [grapefruit, banana, pear],1) ]).

% Part 2
exists(X) :-
	store(_, _, Y),
	member(pastry(X, _, _), Y).

% Passing the correct store parameter based on the company passed in
more_than_four(X) :- X = yumpys, pastries(store(yumpys, [arvin,vino,kart], 
	[ pastry(combo1, [strawberry, orange, banana], 2), 
	pastry(combo2, [banana, orange], 5), 
	pastry(combo3, [orange, peach, banana], 2), 
	pastry(combo4, [guava, mango, papaya, orange],1), 
	pastry(combo5, [grapefruit, banana, pear],1) ]), A), A > 3.

more_than_four(X) :- X = bits_and_bytes, pastries(store(bits_and_bytes, [coet,dos], 
	[ pastry(pinacolada, [orange, pineapple, coconut], 2), 
	pastry(green, [orange, banana, kiwi], 5), 
	pastry(purple, [orange, blueberry, strawberry], 2), 
	pastry(smooth, [orange, banana, mango],1) ]), A), A > 3.

more_than_four(X) :- X = chai_coffee_company, pastries(store(chai_coffee_company, [nike, nica, seth], 
	[ pastry(berry, [orange, blueberry, strawberry], 2), 
	pastry(tropical, [orange, banana, mango, guava], 3), 
	pastry(blue, [banana, blueberry], 3) ]), A), A > 4.

pastries(store(X, _, []), 0).
pastries(store(X, _, [pastry(_, _, _)|Z]), N) :- pastries(store(X, _, Z), M), N is M+1.