/*
2. Define a predicate reverse(L,K) which holds if and only if the list K
is the reverse of the list L.

reverse([1,2,3] , [3,2,1] ).

*/

reverse(L,K) :- naiverev(K,X), L=X.

naiverev([],[]).
naiverev([H|T],R):-  naiverev(T,RevT),  append(RevT,[H],R).
