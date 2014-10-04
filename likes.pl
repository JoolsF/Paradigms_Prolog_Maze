likes(linda, music(the_beatles)).
likes(linda, music(haim)).
likes(jools, music(the_beatles)).
likes(jools, book(crime_and_punishment,
				  author(dostoyevsky))).
likes(jools, book(the_gambler,
				  author(dostoyevsky))).
likes(david, book(kafka_on_the_shore,
				  author(murukami))).
likes(david, book(crime_and_punishment,
				  author(dostoyevsky))).
likes(david, opera(salome)).
likes(graciela, artist(david_hockney)).

friend(X,Y) :- likes(X,Z), likes(Y,Z), \+(X=Y).

/*

likes(jools,book(X,author(Y)))

likes(jools,book(X,author(dostoyevsky))).
*/