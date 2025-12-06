%Day 14
clearvars
close all
clc

S = readlines('input_day14.txt');
S(end) = [];
M = zeros([103 101]);


for i = 1:length(S)
    s = str2double(regexp(S(i),'(-?\d+\.?\d?)','match'));
    px = s(1)+1;
    py = s(2)+1;
    vx = s(3);
    vy = s(4);
    for j = 1:100
        px = px+vx;
        py = py+vy;
        if px > size(M,2)
            px = px-size(M,2);
        elseif px <= 0
            px = px+size(M,2);
        end
        if py > size(M,1)
            py = py-size(M,1);
        elseif py <= 0
            py = py+size(M,1);
        end
    end
    M(py,px) = M(py,px)+1;
end
x = (size(M,2)-1)/2;
y = (size(M,1)-1)/2;

m1 = M(1:y,1:x);

m2 = M(1:y,x+2:end);

m3 = M(y+2:end,1:x);

m4 = M(y+2:end,x+2:end);

sum(m1,'all')*sum(m2,'all')*sum(m3,'all')*sum(m4,'all')


%Part 2
M = zeros([103 101]);
px = zeros([length(S) 1]);
py = zeros([length(S) 1]);
vx = zeros([length(S) 1]);
vy = zeros([length(S) 1]);

for i = 1:length(S)
    s = str2double(regexp(S(i),'(-?\d+\.?\d?)','match'));
    px(i) = s(1)+1;
    py(i) = s(2)+1;
    vx(i) = s(3);
    vy(i) = s(4);
end

for i = 1:7858
    M = zeros([103 101]);
    px = px+vx;
    py = py+vy;
    for j = 1:length(px)
        if px(j) > size(M,2)
            px(j) = px(j)-size(M,2);
        elseif px(j) <= 0
            px(j) = px(j)+size(M,2);
        end
        if py(j) > size(M,1)
            py(j) = py(j)-size(M,1);
        elseif py(j) <= 0
            py(j) = py(j)+size(M,1);
        end
        M(py(j),px(j)) = 1;
    end
    if i>7830
        spy(M)
        title(num2str(i))
        drawnow 
    end
end
i
