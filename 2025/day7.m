% Day 7
clearvars
close all
clc

M = readlines('input_day7.txt');
M = M(1:end-1);

splits = 0;

A = zeros(size(char(M)));

for i = 1:length(M)-1
    m1 = char(M(i));
    m2 = char(M(i+1));

    for j = 1:length(m1)
        if m1(j) == '|'
            if m2(j) == '.'
                m2(j) = '|';
                A(i+1,j) = A(i,j); 
            elseif m2(j) == '^'
                [m2,A] = tachyon_split(m2,j,i+1,A);
                splits = splits + 1;
            end
        elseif m1(j) == 'S'
            m2(j) = '|';
            A(i+1,j) = 1; 
        end
        M(i+1) = m2;
    end
    spy(A)
    drawnow
end

fprintf('Answer for part 1: %d \n', splits)
fprintf('Answer for part 2: %d \n', sum(A(end,:)))

function [m,A] = tachyon_split(m,j,k,A)

for i = j:1:length(m)
    if m(i) ~= '^'
        m(i) = '|';
        A(k,i) = A(k-1,i-1)+ A(k,i) + A(k-1,i);
        break
    end
end

for i = j:-1:1
    if m(i) ~= '^'
        m(i) = '|';
        A(k,i) = A(k-1,i+1) + A(k,i);
        break
    end
end
end