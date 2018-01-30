clear
clc

rocketnumber=50;    %number of rockets to lunch
moves=3000;          %how many moves per rocket
generations=100;    %number of generations

target=[0;200;5];   %[x, y, radius]
%obstacles         %[x1 x2;y11 y12]
obstacles(1).obstacles=[-5 100;50 50];
obstacles(2).obstacles=[-100 5;100 100];
obstacles(3).obstacles=[-5 100;150 150];
pouse_time=0.01;       %time interval between generation. insert [] to skip "animation" and see the end result   
          

%mutation           %every n-th cycle, mutation perC justps to 0.3,
                    %n=0.1*generations
perC=0.0001;         %percent of rockets to get mutated
mut_deg=0.01;       %percent of mutaion segments per rocket
mut_length=0.1;     %lenghth of mutaion as a persent of the lenghts of the rocket path

rockets(rocketnumber,moves,perC,mut_deg,mut_length,...
    target,pouse_time,generations,obstacles);