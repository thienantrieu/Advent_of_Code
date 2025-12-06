%Day 9
clearvars
close all
clc

C = fileread('input_day9.txt');
C(end)=[];
M1 = [];
v = 0;
for i =  1:2:length(C)-1
    M1 = [M1 repelem(v,str2double(C(i))) repelem(-1,str2double(C(i+1)))];
    v = v+1;
end
M1 = [M1 repelem(NaN,str2double(C(end-1))) repelem(v,str2double(C(end)))];


A = zeros([length(M1)-length(find(M1==-1)) 1]);
for i = 1:length(M1)-length(find(M1==-1))
    if M1(i)==-1
        for j = 1:length(M1)-length(find(M1==-1))
            if M1(end)~=-1
                A(i) = M1(end);
                M1(end) = [];
                break
            else
                M1(end) = [];
            end
        end
    else
        A(i) = M1(i);
    end
end


summa  = 0;
for i = 1:length(A)
    summa = summa + A(i)*(i-1);
end
fprintf('%d\n',summa)

%Part 2
M2 = {};
v = 0;
for i =  1:2:length(C)-1
    if str2double(C(i)) > 0
        M2{end+1} = repelem(v,str2double(C(i)));
    end
    if str2double(C(i+1)) > 0
        M2{end+1} = repelem(inf,str2double(C(i+1)));
    end
    v = v+1;
end
if str2double(C(end-1)) > 0
    M2{end+1} = repelem(inf,str2double(C(end-1)));
end

if str2double(C(end)) > 0
    M2{end+1} = repelem(v,str2double(C(end)));
end

for i = length(M2):-1:1
    if ~any(M2{i}==inf) 
        for j = 1:i-1
            if length(find(M2{j}==inf))>= length(M2{i}) 
                indexes = find(M2{j}==Inf);
                indexes = indexes(1:length(M2{i}));
                M2{j}(indexes(1):indexes(end)) = M2{i};
                M2{i} = inf(length(M2{i}),1);
                break
            end
        end
    end
end

A = [];
for i = 1:length(M2)
    for j = 1:length(M2{i})
        if M2{i}(j) ~= inf
            A(end+1) = M2{i}(j);
        else 
            A(end+1) = 0;
        end
    end
end

summa  = 0;
for i = 1:length(A)
    summa = summa + A(i)*(i-1);
end

fprintf('%d\n',summa)
