%Day 2
clearvars
close all
clc

C = readcell("input_day2.xls");

lukumaara = 0;

for i = 1:numel(C)
    R = str2num(C{i});
    [lukumaara] = paiva2(R,lukumaara);
end
lukumaara

%part 2
lukumaara=0;

for i = 1:numel(C)
    R = str2num(C{i});
    vanha = lukumaara;
    [lukumaara] = paiva2(R,lukumaara);
    uusi = lukumaara;
    if uusi==vanha
        for k = 1:numel(R)
            r = R;
            r(k) = [];
            vanha = lukumaara;
            [lukumaara] = paiva2(r,lukumaara);
            uusi = lukumaara;
            if uusi>vanha
                break
            end
        end
    end
end
lukumaara

function[lukumaara] = paiva2(R,lukumaara)
    erotus = 0;
    summa = 0;
    for j = 1:numel(R)-1
        if R(j+1)-R(j)<=3 && R(j+1)-R(j)>0
            erotus = erotus+1;
        end
        if R(j)-R(j+1)<=3 && R(j)-R(j+1)>0
            summa = summa+1;
        end
        if summa==numel(R)-1
            lukumaara=lukumaara+1;
        elseif erotus==numel(R)-1
            lukumaara=lukumaara+1;
        end
    end
end
