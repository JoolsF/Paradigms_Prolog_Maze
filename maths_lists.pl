count(0,[]).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0,[]).
sum(Total, [Head|Tail]) :- sum(Sum,Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/ Count.

/*

We haven’t really told Prolog how to compute sums. We’ ve merely
described sums as rules and goals. To satisfy some of the goals, the
logic engine must satisfy some subgoals. The declarative interpretation
is as follows: “The sum of an empty list is zero, and the sum of a list
is Total if we can prove that the sum of the tail plus the head is Total .
” We’re replacing recursion with the notion of proving goals and
subgoals. Similarly, the count of an empty list is zero; the count of a
list is one for the Head plus the count of the Tail .

So, the average of List is Average if you can prove that.
• the sum of that List is Sum,
• the count of that List is Count, and
• Average is Sum/Count.




*/
