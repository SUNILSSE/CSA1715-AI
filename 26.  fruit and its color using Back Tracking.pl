% Facts about fruit and their colors
fruit(apple, red).
fruit(banana, yellow).
fruit(orange, orange).
fruit(grape, purple).
fruit(watermelon, green).

% Rules to determine the color of a fruit
color(Fruit, Color) :- fruit(Fruit, Color).
color(Fruit, Color) :- fruit(Fruit, Color); not(fruit(Fruit,_)), fail.

% Example queries:
?- color(apple, Color).
Color = red.

?- color(banana, Color).
Color = yellow.

?- color(grape, Color).
Color = purple.

?- color(strawberry, Color).
false.
