% Graph representation (node, heuristic value, neighbors)
graph(a, 4, [b, c]).
graph(b, 2, [d, e]).
graph(c, 3, [f]).
graph(d, 5, []).
graph(e, 1, []).
graph(f, 0, []).

% Best First Search algorithm
best_first_search(Start, Goal, Path) :-
    best_first_search([[Start, 0, []]], Goal, [], Path).

best_first_search([[Goal, _, Path]|_], Goal, _, Path).
best_first_search([[Node, Heuristic, Path]|Rest], Goal, Visited, FinalPath) :-
    findall([NextNode, NextHeuristic, [Node|Path]],
            (graph(Node, _, Neighbors),
             member(NextNode, Neighbors),
             \+ member(NextNode, Visited),
             \+ member(NextNode, Path),
             graph(NextNode, NextHeuristic, _)),
            Next),
    append(Rest, Next, NewQueue),
    sort_queue(NewQueue, SortedQueue),
    best_first_search(SortedQueue, Goal, [Node|Visited], FinalPath).

% Sort the queue based on heuristic value
sort_queue(Queue, Sorted) :-
    predsort(compare_heuristic, Queue, Sorted).

compare_heuristic(<, [_, Heuristic1, _], [_, Heuristic2, _]) :-
    Heuristic1 < Heuristic2.
compare_heuristic(>, [_, Heuristic1, _], [_, Heuristic2, _]) :-
    Heuristic1 >= Heuristic2.

% Example usage
?- best_first_search(a, f, Path), reverse(Path, PathReversed), write(PathReversed).
