sum_to(1,1) :- !.
sum_to(N, Result) :-	TempN is N-1,
			sum_to(TempN, TempResult),
			Result is TempResult + N.

/*

! is a cut operator so the statement sum_to(1,1) operates as a base case.

is line 1 was

	sum_to(1,1).

you would get stack overflow

*/)
