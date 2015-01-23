mazeSize(5, 9).
barrier(1, 8).
barrier(2, 1).
barrier(2, 2).
barrier(2, 4).
barrier(2, 5).
barrier(3, 4).
barrier(3, 7).
barrier(3, 9).
barrier(4, 4).
barrier(4, 7).
barrier(4, 8).
barrier(4, 9).
barrier(5, 2).



insidemaze(Y,X) :-
	mazeSize(Y1,X1),
	\+ Y > Y1,
	\+ Y < 1,
	\+ X > X1,
	\+ X < 1.


findValidMove((Y, X),(NextY,NextX)) :-
	move((Y, X),(NextY,NextX)),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

move((Y,X),(NextY,X)) :-
	NextY is Y + 1.
move((Y,X),(NextY,X)) :-
	NextY is Y - 1.
move((Y,X),(Y, NextX)) :-
	NextX is X + 1.
move((Y,X),(Y, NextX)) :-
	NextX is X - 1.

solve(To,To,[To]) :- !.
solve(From, To, [From|Result] ) :-
  findValidMove(From, FromNext),
  solve(FromNext,To,Result).
