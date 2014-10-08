sum(1,1) :- !.
sum(N,Result) :-
	Tmp is N -1,
	sum(Tmp,TempResult),
	Result is N + TempResult.

