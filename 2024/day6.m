%Day 6
clearvars
close all
clc

C = readcell('input_day6.xls');
luku = 0;
[luku,summa] = helvetti(C,luku);

% Visualization
visual_helvetti(C)

%part 2
luku = 0;
for i = 1:130
    for j = 1:130
        S = C;
        S{i}(j) = '#';
        [luku,summa] = helvetti(S,luku);
    end
end

fprintf('Answer for part 1: %d', summa)
fprintf('Answer for part 2: %d', luku)

function[luku, summa] = helvetti(C,luku)
kulku = zeros([130 130]);
y = 44;
x = 97;
tic
while 1 
    [kulku,y] = pohjoinen(C,kulku,y,x);
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,x] = ita(C,kulku,y,x);
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,y] = etela(C,kulku,y,x);
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,x] = lansi(C,kulku,y,x);
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    if toc > 0.025
        luku = luku+1;
        break
    end
end
summa = sum(kulku,'all');
end

function[] = visual_helvetti(C)
kulku = zeros([130 130]);
spy(kulku)
y = 44;
x = 97;
tic
while 1
    [kulku,y] = pohjoinen(C,kulku,y,x);
    spy(kulku)
    drawnow
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,x] = ita(C,kulku,y,x);
    spy(kulku)
    drawnow
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,y] = etela(C,kulku,y,x);
    spy(kulku)
    drawnow
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    [kulku,x] = lansi(C,kulku,y,x);
    spy(kulku)
    drawnow
    if any(kulku(:,1)==1) || any(kulku(:,end)==1) || any(kulku(end,:)==1)|| any(kulku(1,:)==1)
        break
    end
    if toc >20
        break
    end
end
end

function[kulku,x] = lansi(C,kulku,y,x)
rivi = C{y};
for i = x:-1:1
    if rivi(i) =='#'
        x = i+1;
        break
    else
        kulku(y,i) = 1;
    end
end
end

function[kulku,y] = etela(C,kulku,y,x)
for i = y:130
    c = C{i};
    if c(x)=='#'
        y = i-1;
        break
    else
        kulku(i,x) = 1;
    end
end
end

function[kulku,x] = ita(C,kulku,y,x)
rivi = C{y};
for i = x:length(rivi)
    if rivi(i) =='#'
        x = i-1;
        break
    else
        kulku(y,i)= 1;
    end
end
end

function[kulku,y] = pohjoinen(C,kulku,y,x)
for i = y:-1:1
    c = C{i};
    if c(x) == '#'
        y = i+1;
        break
    else
        kulku(i,x)= 1;
    end
end
end
