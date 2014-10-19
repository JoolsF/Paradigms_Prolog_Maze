append([],L,L).
append([H|T],L2,[H|L3]) :-
	append(T,L2,L3).

prefix(P,L):-  append(P,_,L).
suffix(S,L):-  append(_,S,L).
sublist(SubL,L):-  suffix(S,L),  prefix(SubL,S).

/*
This says that list P is a prefix of list L when there is some list such that L is the result of concatenating P with that list. (We use the anonymous variable since we don’t care what that other list is: we only care that there is some such list or other.) This predicate successfully finds prefixes of lists, and moreover, via backtracking, finds them all:
*/
