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
   1 2 3 4 5 6 7 8 9
  +-----------------+
1 |. . . . . . . x .|
2 |x x . x x . . . .|
3 |. . . x . . x . x|
4 |. . . x . . x x x|
5 |. x . . . . . . .|
  +-----------------+
*/


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




printMaze :-
	printTop,
	printRows(1,1),
	printBottom.



