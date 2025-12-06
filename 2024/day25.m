%Day 25
clearvars
close all
clc

M = readlines('input_day25.txt');
Locks = [];
Keys = [];

for i = 1:8:length(M)
    H = zeros([1 5]);
    if contains(M(i),'#')
        A = M(i+1:i+6);
        for j = 1:length(A)
            h = zeros([1 5]);
            r = regexp(A(j),'#');
            h(r) = 1;
            H = H+h;
        end
        Locks(end+1,:) = H;
    else
        A = M(i:i+5);
        for j = 1:length(A)
            h = zeros([1 5]);
            r = regexp(A(j),'#');
            h(r) = 1;
            H = H+h;
        end
        Keys(end+1,:) = H;
    end
end

summa = 0;
for i = 1:size(Locks,1)
    for j = 1:size(Keys,1)
        yht = Keys(j,:)+Locks(i,:);
            if all(yht<6)
                summa = summa + 1;
            end
    end
end
summa