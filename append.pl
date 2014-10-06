/*
The rule append(List1, List2, List3) is true if List3 is List1
+ List2. It’s a powerful rule that you can use in a variety of ways.

Here's how you could implement your own version of append

Code below concatenates 1, 2 or 3 element list (List1) with List 2.

concatenate([], List, List).
concatenate([Head|[]], List, [Head|List]).
concatenate([Head1|[Head2|[]]], List, [Head1, Head2|List]).
concatenate([Head1|[Head2|[Head3|[]]]], List, [Head1, Head2, Head3|List]).

this rules can be generalised as follows...

*/


concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
	concatenate(Tail1, List, Tail2).


/*

The first clause says concatenating an empty list to List gives you that
List.
The second clause says concatenating List1 to List2 gives you
List3 if the heads of List1 and List3 are the same, and you can prove
that concatenating the tail of List1 with List2 gives you the tail of
List3.
*/

