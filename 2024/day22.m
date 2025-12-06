%Day 22 
clearvars
close all
clc

luvut = readmatrix('input_day22.txt');
summa = 0;

for i = 1:length(luvut)
    luku = luvut(i);
    for j = 1:2000
        luku = bitxor(luku*64,luku);
        luku = mod(luku,16777216);

        luku = bitxor(floor(luku/32),luku);
        luku =  mod(luku,16777216);

        luku = bitxor(luku*2048,luku);
        luku =  mod(luku,16777216);
    end
    summa = summa+luku;
end
fprintf('%d\n',summa)
