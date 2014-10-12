/*

(a) Define a predicate brother(X,Y) which holds iff X and Y are
brothers.
(b) Define a predicate cousin(X,Y) which holds iff X and Y are
cousins.
(c) Define a predicate grandson(X,Y) which holds iff X is a
grandson of Y.
(d) Definene a predicate descendent(X,Y) which holds iff
X is a descendent of Y

*/
father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y) :-
	father(A,X),
	father(A,Y),
	\+(X=Y).

cousin(X,Y) :-
	father(A,X),
	father(B,Y),
	brother(A,B).

grandson(X,Y) :-
	father(A,X),
	father(Y,A).

descendent(X,Y) :-
	father(Y,X).
descendent(X,Y) :-
	father(Z,X),
	descendent(Z,Y).










