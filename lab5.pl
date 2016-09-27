% task1
% Y=ln(lg(sin(X) + exp(X)))

calcY :-
    write("X = "),read(X),
    Y is log(log10(sin(X) + exp(X))),
    write("Y = "), write(Y).

% task2
% sum(i^2/(i^2 + 2i + 3), i=0..k)
calcSum(0,Sum) :-
    Sum is 0.

calcSum(K, Sum) :-
    X is K-1, calcSum(X, Y), Sum is Y + K*K/(K*K + 2*K +3),!.
