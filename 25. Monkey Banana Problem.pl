% Initial state: monkey is at the door, chair is at the window, banana and box are in the middle of the room.
at(monkey, door).
at(chair, window).
at(box, center).
at(banana, center).

% Actions
move(state(middle, onbox, middle, hasnot), grasp, state(middle, onbox, middle, has)).
move(state(P, onfloor, P, H), climb, state(P, onbox, P, H)).
move(state(P1, onfloor, P1, H), drag(P1, P2), state(P2, onfloor, P2, H)).
move(state(P1, onfloor, B, H), walk(P1, P2), state(P2, onfloor, B, H)).

% Can the monkey get the banana?
canget(state(_, _, _, has)) :- write('Monkey has the banana!').
canget(State1) :- move(State1, _, State2), canget(State2).

% Example query
?- canget(state(atdoor, onfloor, atwindow, hasnot)).
