person(malcolm,scotland,plays(rugby)).
person(claude,france,plays(football)).
person(john,england,plays(cricket)).
person(owen,wales,plays(chess)).
person(nigel,england,plays(football)).
person(sean,northern_ireland,plays).


british(X) :-
	person(X, england,_);
	person(X, scotland,_);
	person(X, wales,_);
	person(X, northern_ireland,_).

sportsman(X) :-
	person(X,_, plays(rugby));
	person(X,_, plays(football));
	person(X,_, plays(cricket)).

/*

i. Is Owen a sportsman?

ii. List all the British sportsmen
sportsman(X), british(X).

iii. List all the nationalities of the football players.
person(X,Y,plays(football)).

*/
