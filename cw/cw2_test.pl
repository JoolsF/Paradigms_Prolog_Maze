% solve([1,1],[4,3],Path) :-

/*solve(X,Y,Path) :-
	makeList(X,Y,Path).
makeList(A, A, [A]).
makeList(From, To, [From | Result]) :-
	From =< To,
	FromTemp is From + 1,
	makeList(FromTemp, To, Result).


*/


makeList2([A|B],[A|_],[A|B]).
makeList2([From|TFrom],[HTo|TTo],[[From|TFrom] |Result]) :-
	From < HTo,
	FromTemp is From + 1,
	makeList2([FromTemp|TFrom],[HTo|TTo],Result).





