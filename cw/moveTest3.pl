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



%solve(From,[H,T],Path) :- \+ barrier(H,T).


/* move along y coordinates */

%has destination been reached?
% look ahead to see if barrier is ahead
% movedown([A,B],_,[[A,B]]) :- Y is A + 1, barrier(Y,B),!.
%movedown([A,B],_,_) :-


solve(From,To,Path) :- move(From,To,Path).

move(From,To,Path) :- moveDown(From,To,Path).

movedown([A,B],[A,_],[[A,B]]) :- !.
movedown( [Y,X], [EndY,_], [[Y,X] | Result] ) :-
	        Y < EndY,
		NextY is Y + 1,
		\+ barrier(NextY,X),
		movedown([NextY,X], [EndY,_],Result).



moveup([A,B],[A,_],[[A,B]]) :- !.
moveup( [Y,X], [EndY,_], [[Y,X] | Result] ) :-
		Y > EndY,
		CurrentY is Y - 1,
		moveup([CurrentY,X], [EndY,_],Result).


/* move along x coordinates*/

moveleft([A,B],[_,B],[[A,B]]) :- !.
moveleft( [Y,X], [_,EndX], [[Y,X] | Result] ) :-
		X > EndX,
		CurrentX is X - 1,
		moveleft([Y,CurrentX], [_,EndX],Result).


moveright([A,B],[_,B],[[A,B]]) :- !.
moveright( [Y,X], [_,EndX], [[Y,X] | Result] ) :-

		X < EndX,
		CurrentX is X + 1,
		moveright([Y,CurrentX], [_,EndX],Result).
