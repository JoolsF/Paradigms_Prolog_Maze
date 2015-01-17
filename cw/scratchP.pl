/*

in prolog you get values between two integers with inbuilt predicate

between(1,4,Value).

implementation is something like
count(A, B, A) :- A =< B.
count(A, B, C) :- A < B, A2 is A+1, count(A2, B, C).


to get a list of numbers from A to B use numList e.g
numList(1,5,L).
L = (1,2,3,4,5).

implementation example

jnumlist(A, A, [A]).
jnumlist(From, To, [From | FromTo]) :-
	From =< To,
	From1 is From+1,
	jnumlist(From1, To, FromTo).


*/

movedown([A,B],[A,_],[A,B]).
movedown( [StartY,StartX], [EndY,EndX], [[StartY,StartX] | Result] ) :-
	        StartY < EndY,
		CurrentY is StartY + 1,
		movedown([CurrentY,StartX], [EndY,_],Result).





















