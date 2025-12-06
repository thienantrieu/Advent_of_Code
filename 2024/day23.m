%Day 23
clearvars
close all
clc

S = readlines('input_day23.txt');
S(end) = [];

list = {};

for i = 1:length(S)
    s = split(S(i),'-');
    list1 = {};
    list2 = {};
    for j = 1:length(S)
        J = split(S(j),'-');
        if j==i
            continue
        end
        if s(1)==J(1)
            list1(end+1)= cellstr(J(2));
        elseif s(1)==J(2)
            list1(end+1) = cellstr(J(1));
        end
        if s(2)==J(1)
            list2(end+1)= cellstr(J(2));
        elseif s(2)==J(2)
            list2(end+1) = cellstr(J(1));
        end 
    end
    for j = 1:length(list1)
        for k = 1:length(list2)
            if string(list1(j))==string(list2(k))
                list(end+1,:) = [cellstr(s(1));cellstr(s(2)); list1(j)];
            end
        end
    end

end

v = [];
for i = 1:length(list)
    for j = i+1:length(list)
        if all(sort(string(list(i,:)))==sort(string(list(j,:))))
            v(end+1) = i;
        end
    end
end

list(unique(v),:) = [];
lukumaara = 0;
for i = 1:length(list)
    for j = 1:3
        kirjain = string(list(i,j));
        if kirjain{1}(1)=='t'
            lukumaara = lukumaara+1;
            break
        end
    end
end
lukumaara

