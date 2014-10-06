food_type(cheddar, cheese).
food_type(salami, meat).
food_type(coke, soft_drink).
food_type(brie, cheese).

flavour(cheese, savoury).
flavour(soft_drink, sweet).
flavour(meat, savoury).

food_flavour(X,Y) :- food_type(X,Z), flavour(Z,Y).
