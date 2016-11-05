% Intel
% Family: 1=i3, 2=i5, 3=i7
cpu(1, Family, Frequency, Price) :-
    Price is Family*200 + Frequency*50.

% AMD
% Family: 1=Jaguar, 2=Puma, 3=Zen
cpu(2, Family, Frequency, Price) :-
    Price is Family*150 + Frequency*40.

% Manufacter: 1=Asus, 2=Intel
motherboard(Manufacter,Price) :-
    Price is Manufacter*150.

% Type: DDR2=1, DDR3=2
ram(Type,Size,Price) :-
    Price is Type*100 + Size*50.

% Mafacter Asus=1, Nvidia=2
videocard(Manufacter, Size, Price) :-
    Price is Manufacter*250 + Size*50.

% Type: HDD=1, SDD=2
harddrive(Type,Size,Price) :-
    Price is Type*100 + Size*0.1/Type.

% Phillps
monitor(1, Diagonal, Price) :-
    Price is 300 + Diagonal*20.

% Dell
monitor(2, Diagonal, Price) :-
    Price is 250 + Diagonal*15.

% Samsung
monitor(3, Diagonal, Price) :-
    Price is 200 + Diagonal*25.

goal :-
    write("Let's calculate what is the cost of your computer\n"),
    write("CPU:\nEnter manufacter (1 - Intel, 2 - AMD)\n"),
    read(CpuManufacter),
    (CpuManufacter = 1 ->
        write("Enter CPU family (1 - i3, 2 - i5, 3 - i7)\n")
    ;
        write("Enter CPU family (1 - Jaguar, 2 - Puma, 3 - Zen)\n")
    ),
    read(CpuFamily),
    write("Enter CPU frequency (Gg)\n"),
    read(CpuFrequency),
    nl,
    write("Motherboard:\nEnter manufacter (1 - Asus, 2 - Intel)\n"),
    read(MotherboardManufacter),
    nl,
    write("RAM:\nEnter type (1 - DDR2, 2 - DDR3)\n"),
    read(RamType),
    write("Enter type RAM size (Gb)\n"),
    read(RamSize),
    nl,
    write("Videocard:\nEnter manufacter (1 - Asus, 2 - Nvidia)\n"),
    read(VideoManufacter),
    write("Enter videocard size (Gb)\n"),
    read(VideoSize),
    nl,
    write("Hard Drive:\nEnter type (1 - HDD, 2 - SSD)\n"),
    read(DriveType),
    write("Enter drive size (Gb)\n"),
    read(DriveSize),
    nl,
    write("Monitor:\nEnter manufacter (1 - Phillps, 2 - Dell, 3 - Samsung)\n"),
    read(MonitorManufacter),
    write("Enter monitor diagonal (\")\n"),
    read(MonitorDiagonal),
    nl,
    cpu(CpuManufacter,CpuFamily,CpuFrequency, CpuPrice),
    motherboard(MotherboardManufacter, MotherboardPrice),
    ram(RamType,RamSize,RamPrice),
    videocard(VideoManufacter,VideoSize,VideoPrice),
    harddrive(DriveType,DriveSize,DrivePrice),
    monitor(MonitorManufacter,MonitorDiagonal, MonitorPrice),
    TotalPrice is CpuPrice + MotherboardPrice + RamPrice + VideoPrice + DrivePrice + MonitorPrice,
    write("\nTotal price = "),write(TotalPrice).
