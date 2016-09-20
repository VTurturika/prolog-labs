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
