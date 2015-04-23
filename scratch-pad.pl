/*
NOTE ON BUG

Semi-working. However getting "false" for some things eg
it can get to
      solve((1,1),(1,9),P)
but not
      solve((1,1),(1,9),P)

'Robot' not moving back on itself in certain scenarios. Problem occurs
if start and end X or Y coordinates are the same and there is a barrier
between them such that the robot has to move in a U shape.

?- solve((1,1),(2,9),P).
  1 2 3 4 5 6 7 8 9
  +-----------------+
1|* * * * * * . X . |
2|X X . X X * * * * |
3|. . . X . . X . X |
4|. . . X . . X X X |
5|. X . . . . . . . |
  +-----------------+

?- solve((1,1),(1,9),P).
false.

*/


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

findValidMove([Y, X],[YTo,_],_,[NextY,NextX]) :-
%	Y < YTo,
	moveDown([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[YTo,_],_,[NextY,NextX]) :-
%	Y > YTo,
	moveUp([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[_,XTo],_,[NextY,NextX]) :-
%	X < XTo,
	moveRight([Y,X],[NextY,NextX]),
	\+ barrier(NextY,NextX),
	insidemaze(NextY,NextX).

findValidMove([Y, X],[_,XTo],_,[NextY,NextX]) :-
%	X > XTo,
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




solve(From,To,Path) :-
	findPath(From,To,[],Path),
	printMaze(Path), !.

findPath(To,To,_,[To]) :- !.
findPath(From, To, ListSoFar,[From|Result] ) :-
  findValidMove(From,To,ListSoFar,FromNext),
 \+ member(FromNext,ListSoFar),
  findPath(FromNext,To,[FromNext|ListSoFar],Result).



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











