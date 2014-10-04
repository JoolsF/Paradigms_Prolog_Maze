border(r,g). border(r,b).
border(g,r). border(g,b).
border(b,r). border(b,g).

colouring(Scotland,England,Wales) :-
	border(Scotland,England),
	border(England,Wales),
	\+ (Scotland=Wales).
