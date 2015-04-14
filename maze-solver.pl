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

/*
semi-working however getting "false" for some things eg
solve((1,1),(1,9),P))
solve((5,1),(5,3),P))

'robot' not moving back on itself in certain scenarios.
*/


insidemaze(Y,X) :-
	mazeSize(Y1,X1),
	\+ Y > Y1,
	\+ Y < 1,
	\+ X > X1,
	\+ X < 1.


findValidMove((Y, X),(YTo,_),(NextY,NextX)) :-
	Y < YTo,
	moveDown((Y,X),(NextY,NextX)),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove((Y, X),(YTo,_),(NextY,NextX)) :-
	Y > YTo,
	moveUp((Y,X),(NextY,NextX)),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove((Y, X),(_,XTo),(NextY,NextX)) :-
	X < XTo,
	moveRight((Y,X),(NextY,NextX)),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove((Y, X),(_,XTo),(NextY,NextX)) :-
	X > XTo,
	moveLeft((Y,X),(NextY,NextX)),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).



moveDown((Y,X),(NextY,X)) :-
	NextY is Y + 1.
moveUp((Y,X),(NextY,X)) :-
	NextY is Y - 1.
moveRight((Y,X),(Y, NextX)) :-
	NextX is X + 1.
moveLeft((Y,X),(Y, NextX)) :-
	NextX is X - 1.

solve(To,To,[To]) :- !.
solve(From, To, [From|Result] ) :-
  findValidMove(From,To, FromNext),
  solve(FromNext,To,Result).


/*
MATRIX PRINTER
*/

printMaze :-
	printTop,
	printRows(1,1),
	printBottom.


printTop :-
	write('  1 2 3 4 5 6 7 8 9 ') , nl ,
	write('  +-----------------+') , nl .
printBottom :-
	write('  +-----------------+').



printRows(Row,_) :-
	Row = 6,
	!.
printRows(Row,Col) :-
	write(Row),
	write('|'),
	printLine(Row,Col),
	write('|'),nl,
	NextRow is Row + 1,
	printRows(NextRow,Col).



printLine(_,Col) :-
	Col = 10, !.
printLine(Row,Col) :-
	printElement(Row,Col),
	NextCol is Col + 1,
	printLine(Row,NextCol).



printElement(Row,Col) :-
	barrier(Row,Col),
	write('X ').
printElement(Row,Col) :-
	\+ barrier(Row,Col),
	write('. ').




