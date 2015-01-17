% mazeSize(5, 5).




fromEqualTo(_,_,[1,1]).

solve(From,To,[Path]) :-
	fromEqualTo(From,To,PathResult),
	Path is PathResult.





/*

Test 1, solve maze with no barriers and print list

solve(From, To, Path)
ie. solve([1,1],[5,5],Path)

result
solve([1,1], [2,1],[3,1],[5,1],[5,2],[5,3],[5,4],[5,5]).

Need to make From = To and add each step in the process to a list

solve([FH|FT],[TH|TT],[FH|TT]).

solve([FH|FT],[TH|TT],[[FH|FT]|[TH|TT]]).


solve([FH|FT],[TH|TT],[[FH|FT]|[TH|TT]]) :-
	equal([FH|FT],[TH|TT]).

solve(From,To,Path) :- solve(increaseFrom(From)).


equal(X,X).



*/
