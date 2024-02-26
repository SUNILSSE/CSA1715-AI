% Rules
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Backward chaining implementation
prove_true(Goal) :-
    Goal.
prove_true(Goal) :-
    clause(Goal, Body),
    prove_true(Body).

% Example queries
% Query 1: Is Tom an ancestor of Jim?
% ?- prove_true(ancestor(tom, jim)).
%
% Query 2: Who are the ancestors of Jim?
% ?- prove_true(ancestor(X, jim)).
