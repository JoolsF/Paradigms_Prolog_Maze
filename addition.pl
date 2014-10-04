person(linda, 32).
person(jools, 33).
person(graciela, 67).
person(david, 66).
person(andrea, 36).
person(steve, 3).
person(julie, 97).

addAge(X,Y,Z) :- person(X,A), person(Y,B), Z is A + B. 

/*
addAge(X,Y).

*/