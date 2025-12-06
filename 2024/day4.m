%Day 4
clearvars 
close all
clc

S = readlines('input.day4.txt');
lukumaara = 0;

S = string(S);

for i = 1:length(S)
    rivi = split(S(i),'XMAS');
    rivib = split(S(i),'SAMX');
    lukumaara = lukumaara+(length(rivi)-1)+(length(rivib)-1);
end


for i = -length(S):length(S)
    ds = diag(char(S),i)';
    dg = split(ds,'XMAS');
    dgb = split(ds,'SAMX');
    lukumaara = lukumaara+(length(dg)-1)+(length(dgb)-1);
end

s = char(S);

for i = 1:length(s)-1
    str = s(:,i)';
    jono = split(str,'XMAS');
    jonob = split(str,'SAMX');
    lukumaara = lukumaara+(length(jono)-1)+(length(jonob)-1);
end

I = {};
for i = 0:length(S)-1
    I{i+1} = S(end-i);
end
I = string(I');

for i = -length(I):length(I)
    ds = diag(char(I),i)';
    dg = split(ds,'XMAS');
    dgb = split(ds,'SAMX');
    lukumaara = lukumaara+(length(dg)-1)+(length(dgb)-1);
end

lukumaara

%Part 2
lukumaara = 0;
for i = 2:length(S)-2
    s = S{i};
    for j = 2:length(s)-1
        if s(j) == 'A'
            du = S{j-1};
            dl = S{j+1};
            dur = du(j-1);
            dul = du(j+1);
            dlr = dl(j-1);
            dll = dl(j+1);

            if dur == 'S' && dll == 'M' && dul == 'S' && dlr == 'M'
                lukumaara = lukumaara+1;
            elseif dur == 'M' && dll == 'S' && dul == 'S' && dlr == 'M'
                lukumaara = lukumaara+1;
            elseif dur == 'S' && dll == 'M' && dul == 'M' && dlr == 'S'
                lukumaara = lukumaara+1;
            elseif dur == 'M' && dll == 'S' && dul == 'M' && dlr == 'S'
                lukumaara = lukumaara+1;
            end
        end
    end
end
lukumaara
