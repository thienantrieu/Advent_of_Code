% Day 9
clearvars
close all
clc

M = readmatrix('input_day9.txt');

maximum1 = 0;

for i = 1:length(M)
    for j = i+1:length(M)
        x1 =  min([M(i,1);M(j,1)]);
        x2 = max([M(i,1);M(j,1)]);
        y1 =  min([M(i,2);M(j,2)]);
        y2 = max([M(i,2);M(j,2)]);
        if (x2-x1+1)*(y2-y1+1) >= maximum1
            maximum1 = (x2-x1+1)*(y2-y1+1);
        end
    end
end


fprintf('Answer for part 1: %d \n', maximum1)