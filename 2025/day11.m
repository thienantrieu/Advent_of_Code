% Day 11
clearvars
close all
clc

M = readlines('input_day11.txt');

% Depth First Search time
% whole thing without fft to dac 6min
% whole thing and FFT to DAC max_depth 1-11 16min 30s
% whole thing and FFT to DAC max_depth 1-14 4h 6m
% FFT to DAC max_depth 15 35991.058494 seconds. ~9.99h ~10 h
% FFT to DAC max_depth 16 71320.607029 seconds ~19.81h
% FFT to DAC max_depth 17 194413.898240 seconds ~54h
% Total 3.6583 days runtime

% Breath First Search time
% whole thing without fft to dac 2min 20s
% whole thing and DFS FFT to DAC max_depth 1-11 13min 50s 
% whole thing and DFS FFT to DAC max_depth 1-14 4h 17min

root = cell(length(M)-1,1);
leaf = cell(length(M)-1,1);

for i = 1:length(M)-1
    s = split(M(i),':');
    root{i} = s(1);
    leaf{i} = s(2);
end

%%
% Depth first
you_out = depth_first_search(root,leaf,'you','out',100)

% SVR to FFT
svr_fft = depth_first_search(root,leaf,'svr','fft',100)

% FFT to DAC
fft_dac = depth_first_search(root,leaf,'fft','dac',100)

% DAC to out
dac_out = depth_first_search(root,leaf,'dac','out',100)

%%
% Breadth first
you_out = breadth_first_search({'you'},root,leaf, 'out')

% SVR to FFT
svr_fft = breadth_first_search({'svr'},root,leaf, 'fft')

% FFT to DAC
% Have to use depth first search because of excessive memory use of breadth first search 
fft_dac = depth_first_search(root,leaf,'fft','dac',100)

% DAC to out
dac_out = breadth_first_search({'dac'},root,leaf, 'out')

%%

fprintf('Answer for part 1: %d \n',you_out)
fprintf('Answer for part 2: %d \n',svr_fft*fft_dac*dac_out)

function[paths1] = depth_first_search(root,leaf,first,last,regulator)
paths2 = 0;
for max_depth = 1:regulator
    paths1 = 0;
    for i = 1:length(root)
        if root{i} == first
            s = split(leaf{i},' ');
            for j = 2:length(s)
                depth = 1;
                paths1 = travel_path(s(j), root, leaf, paths1,last, depth, max_depth);
            end
        end
    end
    if paths1 > 0 && paths2 == paths1
        max_depth = max_depth-1;
        break
    else
        paths2 = paths1;
    end
end
end

function[paths] = travel_path(s,root,leaf,paths,last,depth,max_depth)
for i = 1:length(root)
    if root{i} == s
        s = split(leaf{i}, ' ');
        for j = 2:length(s)
            if s(j) == last
                paths = paths +1;
                break
            elseif depth >= max_depth
                break
            else
                paths = travel_path(s(j), root,leaf, paths,last,depth+1,max_depth);
            end
        end
    end
end
end

function[sum] = breadth_first_search(parent,root,leaf, out)
sum2 = 0;
for k = 1:100
    child = {};
    sum = 0;
    for i = 1:length(parent)
        if parent{i} == out
            child{end+1} = parent{i};
            continue
        end
        for j = 1:length(root)
            if parent{i}==char(root{j})
                str = split(leaf{j},' ');
                for k = 2:length(str)
                    child{end+1} = str(k);
                end
            end
        end
    end

    for i = 1:length(child)
        if char(child{i}) == out
            sum = sum+1;
        end
    end
    parent = child;
    if sum > 0 && sum == sum2
        break
    else
        sum2 = sum;
    end
end
end


