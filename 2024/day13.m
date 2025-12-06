%Day 13
clearvars
close all
clc

M = readlines('input_day13.txt');
summa1 = 0;
summa2 = 0;
for i = 1:4:length(M)-1
    a = str2double(regexp(M(i),'(-?\d+\.?\d?)','match'));
    a = a';
    b = str2double(regexp(M(i+1),'(-?\d+\.?\d?)','match'));
    b = b';
    t = [a, b];
    p = str2double(regexp(M(i+2),'(-?\d+\.?\d?)','match'));

    r = rref([t p']);
    r1 = r(:,end);
    if any(floor(r1)==ceil(r1)) && any(r1<=100)
        summa1 = summa1 + 3*r1(1)+r1(2);
    else
        p = p+10000000000000;
        r = rref([t p']);
        r1 = r(:,end);
        summa2 = summa2 +3*r1(1)+r1(2);
    end
end
summa1
fprintf('%d\n',summa2)
