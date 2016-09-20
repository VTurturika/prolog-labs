parents(юрій,галина).
parents(людмила,галина).
parents(ігор,віктор).
parents(ігор,максим).
parents(галина,віктор).
parents(галина,максим).
man(юрій).
man(ігор).
man(віктор).
woman(людмила).
woman(галина).

son(X,Y):-
    parents(Y,X),man(X).
daughter(X,Y):-
    parents(Y,X),woman(X).

mother(X,Y):-
    parents(X,Y),woman(X).

father(X,Y):-
    parents(X,Y),man(X).

grandfather(X,Y):-
    man(X),parents(X,Z),parents(Z,Y).

grandmother(X,Y):-
    woman(X),parents(X,Z),parents(Z,Y).

ancestor(X,Y):-
    parents(X,Y).
ancestor(X,Y):-
    parents(X,Z),ancestor(Z,Y).
