father(morris, david).
father(david, julian).

ancestor(X,Y) :-
	father(X,Y).
ancestor(X,Y) :-
	father(X,Z),ancestor(Z,Y).

/*

ancestor(morris, julian).
ancestor(Ancestor, Descendant).

*/
