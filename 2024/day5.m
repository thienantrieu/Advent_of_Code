%Day 5
clearvars
close all
clc

S = readlines('input_day5.txt');
S(end) = [];
length(S)
jako = find(S=='');
raja = S(1:jako-1);
M = S(jako+1:end);

summa = 0;
summa2 = 0;

for i = 1:length(M)
    t = 1;
    v1 = [];
    v2 = [];
    splitti = split(M(i),',');
    for j = 1:length(splitti)-1
        luku1 = str2double(splitti(j));
        v1 = update_ylaraja(raja,luku1,v1);
        if length(find(v1==str2double(splitti(j+1))))==j
        else
            t = 0;
            break
        end
        k = abs(length(splitti)-j+1);
        luku2 = str2double(splitti(k));
        v2 = update_alaraja(raja,luku2,v2);
        if length(find(v2==str2double(splitti(k-1))))==j
        else
            t = 0;
            break
        end
    end
    if t == 1
        summa = summa + str2double(splitti((length(splitti)+1)/2));
    elseif t ==0
        S = str2num(M(i));
        while 1
            [c,S] = paiva5(S,raja);
            if c == 1
                break
            end
        end
        summa2 = summa2 + S((length(S)+1)/2);
    end
end
summa
summa2

function[v1] = update_ylaraja(raja,luku,v1)
for i = 1:length(raja)
    splitti = split(raja(i),'|');
    if str2double(splitti(1))==luku
        v1(end+1) = str2double(splitti(2));
    end
end

end
function[v2] = update_alaraja(raja,luku,v2)
for i = 1:length(raja)
    splitti = split(raja(i),'|');
    if str2double(splitti(2))==luku
        v2(end+1) = str2double(splitti(1));
    end
end
end

function[c,bogo] = paiva5(bogo,raja)
c = 1;
v1 = [];
v2 = [];
for i = 1:length(bogo)-1
    luku1 = bogo(i);
    v1 = update_ylaraja(raja,luku1,v1);
    if length(find(v1==bogo(i+1)))==i
    else
        bogo(i:i+1) = bogo(i+1:-1:i);
        c = 0;
        break
    end
    k = abs(length(bogo)-i+1);
    luku2 = bogo(k);
    v2 = update_alaraja(raja,luku2,v2);
    if length(find(v2==bogo(k-1)))==i
    else
        bogo(k-1:k) = bogo(k:-1:k-1);
        c = 0;
        break
    end
end
end