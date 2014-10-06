interest(linda,art).
interest(jools,programming).
interest(mike,programming).
interest(sarah, art).
interest(david,music).
interest(jools, music).
interest(linda,music).

friend(X,Y) :- interest(X,Z), interest(Y,Z), \+ (X=Y).
