% start from /lab8 directory
use_module(library(lists)). % append()

% task1

dublicateChar(_,[],[]).
dublicateChar(Ch,[Ch|In],R) :- dublicateChar(Ch,In,Out), append([Ch,Ch], Out, R),!.
dublicateChar(Ch,[Z|In],[Z|Out]) :- dublicateChar(Ch,In,Out),!.

task1 :-
    write("String = "),read(Str),get_char(_),
    write("Char = "),get_char(Char),
    string_chars(Str, StrAsList),
    dublicateChar(Char,StrAsList,ResultAsList),
    string_chars(Result,ResultAsList),
    format("Result: ~w", Result).

% task2

readFile(Stream, []) :-
    at_end_of_stream(Stream).

readFile(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_string(Stream, _, X),
    readFile(Stream,L), !.

printList([]).
printList([Head|Tail]) :-
    write(Head),nl,
    printList(Tail).

task2 :-
    open("task2_out", write, Out),
    write("String = "),read(StrIn),get_char(_),
    write("Char = "),get_char(Char),
    string_chars(StrIn, StrAsList),
    dublicateChar(Char,StrAsList,ResultAsList),
    string_chars(Result,ResultAsList),
    write("Writting to file task2_out\n\n"),
    format(Out, "Result: ~w", Result),
    close(Out),
    write("Reading from file task2_out\n"),
    open("task2_out", read, In),
    readFile(In, Content),
    printList(Content),
    close(In).

% task3
% c - create, a - append, v - view, r - remove, e - exit

menu :-
    S1 = "\n---Menu---\nCreate file - c\nAppend to file - a",
    S2 = "\nView content of file - v\nRemove file - r",
    S3 = "\nExit - e\n\nAction : ",
    format("~w~w~w", [S1,S2,S3]),
    get_char(Choise),
    ( Choise = 'c' ->
        create
    ; Choise = 'a' ->
        append
    ; Choise = 'v' ->
        view
    ; Choise = 'r' ->
        remove
    ; Choise \= 'e' ->
        write("Try again\n")
    ;
        true
    ),
    ( Choise = 'e' ->
        write("Bye\n")
    ;
        skip('\n'),menu
    ).

readUserInput(R) :-
    get_char(X),
    (X \= '.' ->
        readUserInput(L),
        append([X],L,R)
    ;
        R=[]
    ).

create :-
    write("\nCreate file\nFilename = "),
    read(FilenameAsAtom),
    atom_string(FilenameAsAtom, Filename),
    open(Filename, write, File),
    format("Write content to file \"~w\", '.' - EOF\n", Filename),skip('\n'),
    readUserInput(ContentAsList),
    string_chars(Content, ContentAsList),
    write(File, Content),
    close(File),
    format("You content successfully written to file \"~w\"\n", Filename).

append :-
    write("\nAppend to file\nFilename = "),
    read(FilenameAsAtom),
    atom_string(FilenameAsAtom, Filename),
    open(Filename, append, File),
    format("Append content to file \"~w\", '.' - EOF\n", Filename),skip('\n'),
    readUserInput(ContentAsList),
    string_chars(Content, ContentAsList),
    write(File, Content),
    close(File),
    format("You content successfully appended to file \"~w\"\n", Filename).

view :-
    write("\nView file\nFilename = "),
    read(FilenameAsAtom),
    atom_string(FilenameAsAtom, Filename),
    open(Filename, read, File),
    format("Content of file \"~w\":\n\n", Filename),
    readFile(File,ContentAsList),
    printList(ContentAsList),
    close(File).

remove :-
    write("Remove file\nFilename="),
    read(FilenameAsAtom),
    atom_string(FilenameAsAtom, Filename),
    delete_file(Filename),
    format("File \"~w\" successfully removed\n", Filename).

task3 :-
    menu.
