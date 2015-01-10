edge(a,b).
edge(a,e).
edge(b,d).
edge(b,c).
edge(c,a).
edge(e,b).
/*edge(X,Y) :- tedge(X,Y).*/

tedge(Node1,Node2) :-
edge(Node1,SomeNode),
edge(SomeNode,Node2).

/*
The last three lines of this program constitute a rule which defines a new predicate tedge. The
left side of the rule looks just like a fact, except that the parameters of the fact are capitalized
indicating they are variables rather than constants. The right side of the rule consists of two
terms separated by a comma which is read as “AND”. The way to read this rule is as follows.
The pair (Node1,Node2) satisfies the predicate tedge if there is a node SomeNode such
that the pairs (Node1,SomeNode) and (SomeNode,Node2) both satisfy the predicate
edge.
*/