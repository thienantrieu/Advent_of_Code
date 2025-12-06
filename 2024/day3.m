%Day 3
clearvars 
close all
clc

S = readlines('input.day3.txt');

tulo1 = 0;
for i = 1:length(S)
    tulo1 = paiva3(S(i),tulo1);
end
tulo1

%part 2
tulo2 = 0;
t = 1;
for i = 1:length(S)-1
    s = split(S(i),'do');
    for j = 1:length(s)
        rivi = s{j};
        if rivi(1) == '('
            t = 1;
            tulo2 = paiva3(rivi,tulo2);
        elseif rivi(1) == 'n'
            t = 0;
        elseif t==1
            tulo2 = paiva3(rivi,tulo2);
        end
    end
end
tulo2

function[tulo] = paiva3(rivi,tulo)
    r = split(rivi,'mul(');
    for k = 1:length(r)
        vali = split(r(k),')');
        for l = 1:length(vali)
            splitti = split(vali(l),',');
            v = str2double(splitti);
            if anynan(v) == 0 && length(v) ==2
                tulo = tulo +v(1)*v(2);
            end
        end
    end
end