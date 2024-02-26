% Facts: Define the relationships
parent(somit, komal).
parent(somit, manish).
male(komal).
male(manish).

% Rules: Define additional relationships
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), male(Y), X \= Y.
haschild(M) :- parent(M, _).

% Custom messages for queries
brother_message(X, Y) :-
    brother(X, Y),
    format("~w is a brother of ~w.~n", [X, Y]).
brother_message(X, Y) :-
    \+ brother(X, Y),
    format("~w is not a brother of ~w.~n", [X, Y]).

haschild_message(M) :-
    haschild(M),
    format("~w has children.~n", [M]).
haschild_message(M) :-
    \+ haschild(M),
    format("~w does not have any children.~n", [M]).

% Queries: Ask questions about the family
?- brother_message(komal, manish).
?- haschild_message(somit).

