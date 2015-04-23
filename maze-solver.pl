/* MAZE FACTS */

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

/* MAIN PREDICATE */

solve(From,To,Path) :-
	findPath(From,To,[],Path),
	printMaze(Path), !.

findPath(To,To,_,[To]) :- !.
findPath(From, To, ListSoFar,[From|Result] ) :-
  findValidMove(From,FromNext),
  /* Crucial test, check whether coordinate has already been visited*/
  \+ member(FromNext,ListSoFar),
  findPath(FromNext,To,[FromNext|ListSoFar],Result).


/* MAKE A MOVE */
findValidMove([Y, X],[NextY,NextX]) :-
	moveDown([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[NextY,NextX]) :-
	moveUp([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[NextY,NextX]) :-
	moveRight([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[NextY,NextX]) :-
	moveLeft([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).


moveDown([Y,X],[NextY,X]) :-
	NextY is Y + 1.
moveUp([Y,X],[NextY,X]) :-
	NextY is Y - 1.
moveRight([Y,X],[Y, NextX]) :-
	NextX is X + 1.
moveLeft([Y,X],[Y, NextX]) :-
	NextX is X - 1.



/* PRINT GRID */

printMaze(Path) :-
	printTopTwoLines,
	printRows(1,1,Path),
	printBottomLine.


printTopTwoLines :-
	write('  1 2 3 4 5 6 7 8 9 ') , nl ,
	write('  +-----------------+') , nl .
printBottomLine :-
	write('  +-----------------+').


printRows(Row,_,_) :-
	Row = 6,
	!.
printRows(Row,Col,Path) :-
	write(Row),
	write('|'),
	printLine(Row,Col,Path),
	write('|'),nl,
	NextRow is Row + 1,
	printRows(NextRow,Col,Path).


printLine(_,Col,_) :-
	Col = 10, !.
printLine(Row,Col,Path) :-
	printElement(Row,Col,Path),
	NextCol is Col + 1,
	printLine(Row,NextCol,Path).


printElement(Row,Col,Path) :-
	member([Row,Col],Path),
	write('* ').
printElement(Row,Col,_) :-
	barrier(Row,Col),
	write('X ').
printElement(Row,Col,_) :-
	\+ barrier(Row,Col),
	write('. ').