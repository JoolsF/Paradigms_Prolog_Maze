follows(anne,fred).
follows(fred,julie).
follows(fred,susan).
follows(john,fred).
follows(julie,fred).
follows(susan,john).
follows(susan,julie).

tweet(anne,tweet1).
tweet(anne,tweet5).
tweet(fred,tweet2).
tweet(fred,tweet7).
tweet(fred,tweet8).
tweet(john,tweet3).
tweet(john,tweet4).
tweet(julie,tweet6).
tweet(susan,tweet9).
tweet(susan,tweet10).

what_tweets_visible(X,Y) :-
	follows(X,Z),
	tweet(Z,Y).

friends(X,Y) :-
	follows(X,Y),
	follows(Y,X).

/* retweets(fred, What).
needs works as it needs to eliminate mutual friends.
*/

retweets_visible(X,Y) :-
	follows(X,Z),
	follows(Z,A),
	\+(X=A),
	tweet(A,Y).
