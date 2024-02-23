% Base case: Sum of integers from 1 to 0 is 0
sum_integers(0, 0).

% Recursiv
sum_integers(N, Sum) :-
    N > 0,
    N1 is N - 1,
    sum_integers(N1, SubSum),
    Sum is N + SubSum.
