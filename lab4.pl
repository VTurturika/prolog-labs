member(Elem, [Elem|_Tail]).
member(Elem, [_Head|Tail]) :- member(Elem, Tail).

unique([]):- !.
unique([Head|Tail]) :-
    member(Head, Tail), !, fail;
    unique(Tail).

name(X) :- X=sergey; X=boris; X=leonid; X=grigoriy; X=victor.
city(X) :- X=ruga; X=minsk; X=lviv; X=harkiv; X=moskva.
bicycle(X) :- X=ruga; X=minsk; X=lviv; X=harkiv; X=moskva.

solve(Result) :-
    Result=[driver(N1,C1,B1), driver(N2,C2,B2), driver(N3,C3,B3),
            driver(N4,C4,B4), driver(N5,C5,B5)],

    name(N1), name(N2), name(N3), name(N4), name(N5), unique([N1,N2,N3,N4,N5]),
    city(C1), city(C2), city(C3), city(C4), city(C5), unique([C1,C2,C3,C4,C5]),
    bicycle(B1), bicycle(B2), bicycle(B3), bicycle(B4), bicycle(B5), unique([B1,B2,B3,B4,B5]),

    C1 \= B1, C2 \= B2, C3 \= B3, C4 \= B4, C5 \= B5,

    member(driver(sergey,_,ruga), Result),
    member(driver(boris,ruga,minsk), Result),
    member(driver(grigoriy,_,harkiv), Result),
    member(driver(victor,lviv,moskva), Result),

    member(driver(_, minsk,X), Result),
    member(driver(leonid,X,_), Result).

writeSolution([]) :- !.
writeSolution([driver(Name, City, Bicycle) | List]) :-
    format("~w:\n\tCity\t~w\n\tBicycle\t~w\n", [Name, City, Bicycle]),
    writeSolution(List).

getSolution:-
    solve(X), X=[driver(sergey,_,_), driver(boris,_,_), driver(leonid,_,_),driver(grigoriy,_,_),driver(victor,_,_)],
    writeSolution(X).
