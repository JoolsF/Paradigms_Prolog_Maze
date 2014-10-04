interest(linda,art).
interest(jools,programming).
interest(mike,programming).
interest(sarah, art).
interest(david,music).
interest(jools, music).
interest(linda,music).

friend(jools,X) :- interest(X,music), \+(jools=X).
