edge(a,b).
edge(a,f).
edge(b,c).
edge(c,d).
edge(c,e).
edge(e,d).
edge(f,g).
edge(f,c).
edge(f,e).
edge(g,c).

tedge(A,X) :- 
	edge(A,Somenode1),
	edge(Somenode1, Somenode2),
	edge(Somenode2, X).

path(Node1,Node2) :-
	edge(Node1,Node2).
path(Node1,Node2) :-
	edge(Node1,SomeNode),
	path(SomeNode,Node2).
	
	
	
/*	
	(a,b)
	(b,c)
	(c,d)
*/