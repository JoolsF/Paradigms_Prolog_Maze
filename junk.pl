/*[1,2,3]

H = 1
T = 2,3
*/

sum(0,[]).
sum(Total,[H|T]) :-
	sum(Sum,T),
	Total is H + Sum.
