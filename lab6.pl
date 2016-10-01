% task1

list(N,N,[]) :- !.
list(N,I,[X|L]) :-
    I < N,
    X is 10 + I*5,
    J is I+1,
    list(N,J,L).

average(_,S,N,[]) :-
    S is 0,
    N is 0.
average(A,S,N,[X|L]) :-
    average(_,Z,M,L),
    S is Z + X,
    N is M + 1,
    A is S/N.

task1 :-
    write("N = "),read(N),
    list(N,0,List),
    write("List = "),write(List),nl,
    average(A,_,_,List),
    format("Average = ~10f", A).

% task2

min([X], X).
min([X|L], X) :- min(L,M), X < M, !.
min([_|L], M) :- min(L,M).

deleteFirst(_, 1, [],[]).
deleteFirst(X, 0, [X|L], R) :- deleteFirst(X,1,L,R).
deleteFirst(X, 0, [Y|L], [Y|R]) :- deleteFirst(X,0,L,R).
deleteFirst(X, 1, [Y|L], [Y|R]) :- deleteFirst(X,1,L,R).

mySort([Min],[Y]) :- Y is Min.
mySort(In, [Y|Out]) :-
    min(In,M),
    deleteFirst(M,0,In,R),
    Y is M,
    mySort(R,Out).

task2 :-
    write("L = "),read(List),
    mySort(List,Result),
    write("Result = "),write(Result),nl.

% task3

man(X) :- X=юрій; X=віктор_1; X=віктор_2; X=ігор; X=віктор_3; X=максим.
woman(X) :- X=людмила; X=марія; X=галина; X=олена.

parent(юрій, віктор_2). parent(юрій,галина).
parent(людмила,віктор_2). parent(людмила,галина).

parent(віктор_1,ігор). parent(віктор_1,олена).
parent(марія,ігор). parent(марія,олена).

parent(галина,віктор_3). parent(галина,максим).
parent(ігор,віктор_3). parent(ігор,максим).

son(Child, Parent) :- parent(Parent,Child), man(Child).
daughter(Child, Parent) :- parent(Parent,Child), woman(Child).

uncle(Who,Whom) :-
    man(Who),man(Parent),
    parent(Parent,Who),
    parent(Parent,BrotherOrSister),
    Who \= BrotherOrSister,
    parent(BrotherOrSister, Whom).

aunt(Who,Whom) :-
    woman(Who),man(Parent),
    parent(Parent,Who),
    parent(Parent,BrotherOrSister),
    Who \= BrotherOrSister,
    parent(BrotherOrSister, Whom).

task3 :-
    findall([Son, Parent], son(Son,Parent), R1),
    write("List of sons:\n"),
    write(R1),nl,nl,
    findall([Daughter, Parent], daughter(Daughter,Parent), R2),
    write("List of daughters:\n"),
    write(R2),nl,nl,
    findall([Who, Whom], uncle(Who,Whom), R3),
    write("List of uncles:\n"),
    write(R3),nl,nl,
    findall([Who, Whom], aunt(Who,Whom), R4),
    write("List of aunts:\n"),
    write(R4),nl.
