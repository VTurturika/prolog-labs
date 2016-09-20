% route(RouteNumber, Destination, Time, Day)

route(1, kiev, 12, everyday).
route(2, lviv, 13, paired).
route(3, london, 14, not_paired).
route(4, rome, 15, everyday).
route(5, new_york, 17, paired).
route(6, california, 22, not_paired).

printList([]).
printList([Elem|List]) :-
    write(Elem),nl,
    printList(List).

% task 1
printAllRoutes :-
    findall([RouteNum, Dest, Time, Day],route(RouteNum, Dest, Time, Day), Result),
    write("----------"),nl,
    printList(Result),nl.

% task 2
printPairedRoutes :-
    findall([RouteNum, Dest, Time],route(RouteNum, Dest, Time, paired), Result),
    write("----------"),nl,
    printList(Result),nl.

% task 3
printRoutesBefore :-
    read(MaxTime),
    findall([RouteNum,Dest,Time],(route(RouteNum,Dest, Time, everyday), Time =< MaxTime),Result),
    write("----------"),nl,
    printList(Result),nl.
