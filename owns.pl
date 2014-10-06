owns(jools, book(jpod, author(doug_coupland))).
owns(david, book(generationx, author(doug_coupland))).
owns(jools, book(the_outsider, author(albert_camus))).
owns(jools, house).
owns(linda, book(jpod, author(doug_coupland))).
owns(james, xbox).


friends(X,Y) :- owns(X, book(_, author(doug_coupland))),
		owns(Y, book(_, author(doug_coupland))).

bestFriends(X,Y) :- owns(X, book(A, author(doug_coupland))),
		    owns(Y, book(A, author(doug_coupland))).
