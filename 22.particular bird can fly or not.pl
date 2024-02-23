% Facts
can_fly(sparrow).
can_fly(eagle).
can_fly(albatross).

% Rules
bird(X) :- can_fly(X), format('~w can fly.~n', [X]).
bird(X) :- \+ can_fly(X), format('~w cannot fly.~n', [X]).

% Queries
% Query: ?- bird(sparrow).
% Output: sparrow can fly.

% Query: ?- bird(penguin).
% Output: penguin cannot fly.
