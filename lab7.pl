%
% vacancy(title, position, salary, Skills, [Applicant])
% applicant(name, middlename, surname, Skills)
% skills(education, age, sex, languages, pc, experience)
%
% title, position, name, surname, middlename : string
% salary : float
% age, experience : int
% sex : male, female, all
% education : high | middle
% languages : [string]
% pc : [string]

vacancy(company1, position1, 2500,
        skills(high,30,all,[ua,en], [word], 3),
        [
            applicant(name1, middlename1, surname1, skills(high, 32, male, [ua, ru, en], [word, excel], 5)),
            applicant(name2, middlename2, surname2, skills(high, 45, female, [ua, en], [word, excel], 3)),
            applicant(name3, middlename3, surname3, skills(high, 30, female, [ua, en], [word, excel], 7)),
            applicant(name4, middlename4, surname4, skills(high, 40, male, [ua, ru, en], [word], 10))
        ]).

vacancy(company1, position2, 3000,
        skills(high,25, male,[ua,en], [word, excel, skype], 3),
        [
            applicant(name5, middlename5, surname5, skills(high, 32, male, [ua, en], [word, excel], 5)),
            applicant(name6, middlename6, surname6, skills(high, 28, male, [ua, ru, en], [word, excel], 4)),
            applicant(name7, middlename7, surname7, skills(high, 30, male, [ua, en], [word, excel], 3))
        ]).

vacancy(company2, position1, 1500,
        skills(middle,20,female,[ua], [], 1),
        [
            applicant(name8, middlename8, surname8, skills(middle, 20, female, [ua], [], 1)),
            applicant(name9, middlename9, surname9, skills(middle, 25, female, [ua,en], [], 2)),
            applicant(name10, middlename10, surname10, skills(middle, 30, female, [ua], [], 3))
        ]).

vacancy(company2, position2, 2700,
        skills(high, 25, all, [en], [word, excel], 3),
        [
            applicant(name11, middlename11, surname11, skills(high, 25, male, [ua,en], [word, excel], 3)),
            applicant(name11, middlename11, surname12, skills(high, 30, female, [en], [word, excel], 4)),
            applicant(name13, middlename13, surname13, skills(high, 40, male, [en], [word, excel], 5))
        ]).

vacancy(company3, position1, 3000,
        skills(high, 35,male,[ua,en], [word, excel, skype], 5),
        [
            applicant(name17, middlename17, surname17, skills(middle, 20, male, [ua, ru], [], 5)),
            applicant(name18, middlename18, surname18, skills(middle, 22, male, [ua, ru, en], [], 5)),
            applicant(name19, middlename19, surname19, skills(middle, 21, male, [ua, ru, en], [], 5))
        ]).

vacancy(company4, position1, 3000,
        skills(high, 25, female,[ua,en], [word, excel], 3),
        [
         	applicant(name20, middlename20, surname20, skills(high, 25, female, [ua, ru, en], [word, excel], 5)),
            applicant(name21, middlename21, surname21, skills(high, 30, female, [ua, ru, en], [word, excel], 5))
        ]).

vacancy(company4, position2, 2500,
        skills(middle,30,all,[ua,en], [word, excel, skype], 5),
        [
            applicant(name22, middlename22, surname22, skills(middle, 32, female, [ua, en], [word, excel, skype], 5)),
            applicant(name23, middlename23, surname23, skills(middle, 40, male, [ua, en], [word, excel, skype], 6)),
            applicant(name24, middlename24, surname24, skills(middle, 35, female, [ua,en], [word, excel, skype], 7))
        ]).

vacancy(company5, position3, 2500,
        skills(high,30,female,[ua,en], [word, excel], 3),
        [
            applicant(name25, middlename25, surname25, skills(high, 32, female, [ua, ru, en], [word, excel], 5))
        ]).

% task1

doTask1( [[Company, Position, Applicants]], CompanyMax, PositionMax, Max) :-
    length(Applicants,X),
    Max is X,
    CompanyMax=Company,
    PositionMax=Position.

doTask1([[Company, Position, Applicants ] | Tail], CompanyMax, PositionMax, Max) :-
    doTask1(Tail, C, P, M),
    length(Applicants, X),
    (X > M ->
        Max is X,
        CompanyMax=Company,
        PositionMax=Position
    ;
        Max is M,
        CompanyMax=C,
        PositionMax=P
    ).

task1 :-
    findall([Company, Position, Applicants], vacancy(Company,Position,_,_,Applicants), Result),
    doTask1(Result, CompanyMax,PositionMax, Max),
    format("~w - ~w - ~w applicants", [CompanyMax, PositionMax, Max]).

% task2
use_module(library(lists)).

doTask2([]).
doTask2( [[Company,Position,Langs] | Tail] ) :-
    (member(en,Langs) ->
        format("~w - ~w\n", [Company,Position]),
        doTask2(Tail)
    ;
        doTask2(Tail)
    ).

task2 :-
    findall([Company,Position,Langs], (vacancy(Company,Position,_,skills(high,_,Sex,Langs,_,_),_), Sex \= female), R),
    doTask2(R).

% task3

doTask3([]).
doTask3([[Company, Position, Salary] | Tail]) :-
    format("~w - ~w Salary: ~w\n", [Company, Position, Salary]),
    doTask3(Tail).

task3 :-
    write("Salary = "),read(Salary),nl,
    findall([Company,Position, RealSalary], (vacancy(Company,Position,RealSalary,_,_), RealSalary >= Salary),R),
    doTask3(R).

% task4

doTask4([]).
doTask4([Applicants | Tail]) :-
    printPcUsers(Applicants),
    doTask4(Tail).

printPcUsers([]).
printPcUsers([applicant(Name,Middle,Surname,skills(Education,_,_,_,PcSkills,_)) | Tail]) :-
    length(PcSkills, L),
    (L > 0 ->
        format("~w ~w ~w - Education: ~w, PC Skills: ~w\n", [Surname,Name, Middle,Education,PcSkills]),
        printPcUsers(Tail)
    ;
        printPcUsers(Tail)
    ).

task4 :-
    findall(Applicants, vacancy(_,_,_,_,Applicants), R),
    doTask4(R).

task5 :-
    write("Position = "),read(Position),nl,
    findall(Company, vacancy(Company,Position,_,_,_),Result),
    write(Result).
