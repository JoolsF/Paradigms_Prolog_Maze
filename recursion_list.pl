is_in( X, [X|_] ).
is_in( X, [_|Y]) :- is_in(X,Y).

/*

lists can be split into a head tail using the | operator

is_in(d,[a,b,c,d,e,f]).

*/