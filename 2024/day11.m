%Day 11 
clearvars
close all
clc

M = readmatrix('input_day11.txt');
tic
for i = 1:45
    N = parallelblink(M);
    M = vaihto(N);
    if i == 25
        length(M)
    end
end
toc

u = unique(M);
length(u)

summa = 0;
for i = 1:length(u)
    U = u(i);
    for j = 1:30
        N = parallelblink(U);
        U = vaihto(N);
    end
    summa = summa + length(find(M==u(i)))*length(U);
end
fprintf('%d\n',summa)
toc

function[M] = vaihto(N)
M = [];
for i = 1:size(N,1)
    for j = 1:size(N,2)
        if N(i,j) == 0 || N(i,j) <-1
        elseif N(i,j) == -1
            M(end+1) = 0;
        else
            M(end+1) = N(i,j);
        end
    end
end
end

function[N] = parallelblink(M)
n = length(M);
N = zeros([n 2]);
parfor i = 1:n
    v = [0;0]
    str = num2str(M(i));
    pituus = length(str);
    if M(i) == 0
        v(1) = 1;
        v(2) = -2;
    elseif M(i)==10
        v(1) = 1;
        v(2) = -1;
    elseif mod(pituus,2)==0
        alku = str(1:pituus/2);
        loppu = str((pituus/2)+1:end);

        alku = str2double(alku);
        loppu = str2double(loppu);
        if alku == 0
            alku = -1;
        end
        if loppu == 0
            loppu = -1;
        end

        v(1) = alku;
        v(2) = loppu;
    else
        v(1) = M(i)*2024;
        v(2) = -2;
    end
    N(i,:) = v
end
end