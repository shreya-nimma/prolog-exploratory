% Given a problem where there are 4 students and some given clues,
% the task of this problem is to identify their respective majors, 
% their TV show preferences, and their birth year.

% Defining the all members predicates
all_members([H], L) :- member(H, L).
all_members([H|T], L) :- member(H, L), all_members(T, L).

% And predicate
and([H]) :- H.
and([H|T]) :- H, and(T).

% Or predicate
or([H]) :- H,!.
or([H|_]) :- H,!.
or([_|T]) :- or(T).

solve(Arpit, Manoj, Shristi, Dhruv) :-

	% Forming a total set
	All = [Arpit, Manoj, Shristi, Dhruv],

	% All students
	Arpit = [Arpit_major, Arpit_tvshow, Arpit_birth],
	Manoj = [Manoj_major, Manoj_tvshow, Manoj_birth],
	Shristi = [Shristi_major, Shristi_tvshow, Shristi_birth],
	Dhruv = [Dhruv_major, Dhruv_tvshow, Dhruv_birth],

	% Ensure all values exist once
	all_members([computer_science, electronics, mechanical, civil], [Arpit_major, Manoj_major, Shristi_major, Dhruv_major]),
	all_members([house_of_cards, black_mirror, mr_robot, suits], [Arpit_tvshow, Manoj_tvshow, Shristi_tvshow, Dhruv_tvshow]),
	all_members([1994, 1995, 1996, 1997], [Arpit_birth, Manoj_birth, Shristi_birth, Dhruv_birth]),

	% Clue 1
	member([_, suits, 1996], All),

	% Clue 2
	member([_, house_of_cards, Birth1], All),
	member([electronics, _, Birth2], All),
	Birth1 > Birth2,

	% Clue 3
	not(Shristi_major = computer_science),

	% Clue 4
	member([electronics, _, Birth4], All),
	or([and([Birth4 = 1995, Dhruv_birth = 1996]),and([Birth4 = 1996, Dhruv_birth = 1995])]),

	% Clue 5
	not(Manoj_birth = 1995),

	% Clue 6
	member([computer_science, black_mirror, _], All),

	% Clue 7
	or([Dhruv_major = mechanical, Arpit_major = mechanical]),

	% Clue 8
	not(Shristi_tvshow = house_of_cards),
	not(Arpit_tvshow = house_of_cards),

	% Clue 9
	member([computer_science, _, Birth9], All),
	Birth9 < Dhruv_birth,

	% Clue 10
	member([Branch, suits, _], All),
	or([Branch = civil, Branch = mechanical]).