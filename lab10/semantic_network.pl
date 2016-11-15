% task1

% Database
%
% is_A(Child, Parent)
% property(Object, property, Value)
%
% %
property(programming_lang, implement, algorithm).

    is_A(compiled, programming_lang).
        property(compiled, build_by, compiler).

        is_A(binary_code, compiled).
            property(binary_code, run_by, cpu).
            property(binary_code, typization, static).

            is_A(c, binary_code).
                property(c, paradigm, structured).
                property(c, sphere, system).
                property(c, sphere, desktop).

            is_A(cpp, binary_code).
                property(cpp, paradigm, structured).
                property(cpp, paradigm, object_oriented).
                property(cpp, sphere, system).
                property(cpp, sphere, desktop).
                property(cpp, sphere, backend).

            is_A(golang, binary_code).
                property(golang, paradigm, structured).
                property(golang, sphere, desktop).
                property(golang, sphere, backend).

        is_A(byte_code, compiled).
            property(byte_code, run_by, jvm).

            is_A(java, byte_code).
                property(java, typization, static).
                property(java, paradigm, object_oriented).
                property(java, paradigm, structured).
                property(java, sphere, desktop).
                property(java, sphere, backend).
                property(java, sphere, android).

            is_A(groovy, byte_code).
                property(groovy, typization, dynamic).
                property(groovy, paradigm, object_oriented).
                property(groovy, paradigm, structured).
                property(groovy, sphere, scripting).

            is_A(scala, byte_code).
                property(scala, typization, static).
                property(scala, paradigm, object_oriented).
                property(scala, paradigm, functional).
                property(scala, sphere, desktop).
                property(scala, sphere, backend).

    is_A(interpreted, programming_lang).
        property(interpreted, run_by, interpreter).

        is_A(javascript, interpreted).
            property(javascript, paradigm, structured).
            property(javascript, paradigm, prototyped).
            property(javascript, paradigm, functional).
            property(javascript, sphere, frontend).
            property(javascript, sphere, backend).

        is_A(python, interpreted).
            property(python, paradigm, structured).
            property(python, paradigm, object_oriented).
            property(python, paradigm, functional).
            property(python, sphere, scripting).
            property(python, sphere, desktop).
            property(python, sphere, backend).

        is_A(php, interpreted).
            property(php, paradigm, structured).
            property(php, paradigm, object_oriented).
            property(php, sphere, backend).

% Goals

all_properties(Object) :-
    findall([Key, Value], property(Object, Key, Value), Result),
    format("~w properties:\n\t", Object), write(Result),nl,
    is_A(Object, Parent) -> all_properties(Parent) ; true.

has_properties(Property, Value) :-
    findall(Object, property(Object,Property,Value), Result),
    write(Result),nl.
