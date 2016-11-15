% task2

use_module(library(lists)). % member()

% Database
%
% frame(Name, Parent, [Own_Properties], [Overwritten_Properties])
% is_a(Child, Parent)
% <Property>(Value)
%
% %
frame(name(programming_lang), _, [implement(algorithm)], []).

frame(name(compiled), is_a(programming_lang), [

    build_by(compiled),
    run_by(cpu)
], _).

frame(name(interpreted), is_a(programming_lang), [run_by(interpreter)], []).

frame(name(binary_code), is_a(compiled), [typization(static)], []).
frame(name(byte_code),   is_a(compiled), [typization(static)], [run_by(jvm)]).

frame(name(c), is_a(binary_code), [

    paradigm(structured),
    sphere(system),
    sphere(desktop)
], []).

% compiled
frame(name(cpp), is_a(binary_code), [

    paradigm(structured),
    paradigm(object_oriented),
    sphere(system),
    sphere(desktop),
    sphere(backend)
], []).

frame(name(golang), is_a(binary_code), [

    paradigm(structured),
    sphere(desktop),
    sphere(backend)
], []).

frame(name(java), is_a(byte_code), [

    paradigm(structured),
    paradigm(object_oriented),
    sphere(desktop),
    sphere(backend),
    sphere(android)
], []).

frame(name(groovy), is_a(byte_code), [

    paradigm(object_oriented),
    paradigm(structured),
    sphere(scripting)

], [typization(dynamic)]).

frame(name(scala), is_a(byte_code), [

    paradigm(object_oriented),
    paradigm(functional),
    sphere(desktop),
    sphere(backend)
], []).

% interpreted
frame(name(javascript), is_a(interpreted), [

    paradigm(structured),
    paradigm(prototyped),
    paradigm(functional),
    sphere(frontend),
    sphere(backend)
], []).

frame(name(python), is_a(interpreted), [

    paradigm(structured),
    paradigm(object_oriented),
    paradigm(functional),
    sphere(desktop),
    sphere(backend),
    sphere(scripting)
], []).

frame(name(php), is_a(interpreted), [

    paradigm(structured),
    paradigm(object_oriented),
    sphere(backend)
], []).

% Goals

all_properties(ObjectName) :-
    frame(name(ObjectName), is_a(Parent), ObjectProperties, OverwrittenProperties),
    format("~w properties: ~w\n~w overwritten properties: ~w\n\n",
            [ObjectName, ObjectProperties, ObjectName, OverwrittenProperties]),
    atom(Parent) -> all_properties(Parent) ; true.

has_properties(Property, Value) :-
    atom_concat(Property, "(", R1),
    atom_concat(R1, Value ,R2),
    atom_concat(R2, ")", TermAsString),
    term_string(PropertyTerm, TermAsString),
    findall(ObjectName,
                (
                    frame(name(ObjectName), _, Properties,_),
                    member(PropertyTerm, Properties)

                ), Result),
    write(Result).


% task3

choose_language :-
    write("Let's choose programming language for you!\n\n"),
    question,
    action(Languages),
    format("So, you must to try ~w", Languages),
    retractall(need(_)).

question :-
    write("Do you want to create web application?\n(yes\\no) "),nl,
    read(X), X = yes,
    assert(need(web)), fail.

question :-
    write("Do you like to use object oriented paradigm?\n(yes\\no )"),nl,
    read(X), X = yes,
    assert(need(oop)).

question.

action("C++, Java or PHP") :- need(web), need(oop).
action("JavaScript, Scala or Python") :- need(web), \+ need(oop).
action("C++, Java or Scala") :- \+ need(web), need(oop).
action("Go, C or Python") :- \+ need(web), \+ need(oop).
