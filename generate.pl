int(0).
int(X) :- int(Y), X is Y+1.

idiv(X,Y,Result) :-
	int(Result),
	Prod1 is Result * Y,
	Prod2 is (Result + 1) * Y,
	Prod1 =< X,
	Prod2 > X,
	!.

