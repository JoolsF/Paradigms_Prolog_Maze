/*
an inefficient way of reversing a list
*/

naiverev([],[]).
naiverev([H|T],R):-  naiverev(T,RevT),  append(RevT,[H],R).
