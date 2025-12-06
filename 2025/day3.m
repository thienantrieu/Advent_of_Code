% Day 3
clearvars
close all
clc

M = readlines('input_day3.txt');

sum1 = 0;
sum2 = 0;

for i = 1:length(M)-1
    s = split(M(i),'');
    str = s(2:end-1);

    stop_index1 = 1;
    stop_index2 = 1;

    str_arr1 = {};
    str_arr2 = {};

    for j = 1:-1:0
        [str_arr1, stop_index1] = optim_max(str_arr1, str,stop_index1,j);
    end

    for j = 11:-1:0
        [str_arr2, stop_index2] = optim_max(str_arr2, str, stop_index2, j);
    end

    sum1 = sum1 + str2double(cell2mat(str_arr1));

    sum2 = sum2 + str2double(cell2mat(str_arr2));
end

fprintf('Answer for part 1: %d \n', sum1)
fprintf('Answer for part 2: %d \n', sum2)

function[str_arr, stop_index] = optim_max(str_arr,str,stop_index,j)

max = 1;

for i = length(str)-j:-1:stop_index
    if str2double(str(i)) >= max
        max = str2double(str(i));
        stop_index = i+1;
    end
end
str_arr{end+1} = num2str(max);

end