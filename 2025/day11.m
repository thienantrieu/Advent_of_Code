% Day 11
clearvars
close all
clc

M = readlines('input_day11.txt');

% Depth First Search time
% whole thing without fft to dac 6min
% whole thing and FFT to DAC max_depth 1-14 4h 6m
% FFT to DAC max_depth 15 35991.058494 seconds. ~9.99h ~10 h
% FFT to DAC max_depth 16 71320.607029 seconds ~19.81h
% FFT to DAC max_depth 17 194413.898240 seconds ~54h
% Total 3.6583 days runtime

root = cell(length(M)-1,1);
leaf = cell(length(M)-1,1);

for i = 1:length(M)-1
    s = split(M(i),':');
    root{i} = s(1);
    leaf{i} = s(2);
end

paths2 = 0;
for max_depth = 1:100
    paths1 = 0;
    for i = 1:length(root)
        if root{i} == 'you'
            s = split(leaf{i},' ');
            for j = 2:length(s)
                depth = 1;
                paths1 = depth_first_search(s(j), root, leaf, paths1,'out', depth, max_depth);
            end
        end
    end
    if paths1 > 0 && paths2 == paths1
        max_depth = max_depth-1
        break
    else
        paths2 = paths1;
    end
end
paths1

% SVR to FFT
path_fft2 = 0;
for max_depth = 1:100
    path_fft = 0;
    for i = 1:length(root)
        if root{i} == 'svr'
            s = split(leaf{i},' ');
            for j = 2:length(s)
                depth = 1;
                path_fft = depth_first_search(s(j), root, leaf, path_fft, 'fft',depth, max_depth);
            end
        end
    end
    if path_fft > 0 && path_fft == path_fft2
        max_depth = max_depth-1;
        break
    else
        path_fft2 = path_fft;
    end
end
path_fft

% FFT to DAC
fft_dac2 = 0;
for max_depth = 1:1
    fft_dac = 0;
    for i = 1:length(root)
        if root{i} == 'fft'
            s = split(leaf{i},' ');
            for j = 2:length(s)
                depth = 1;
                fft_dac = depth_first_search(s(j), root, leaf, fft_dac, 'dac', depth,max_depth);
            end
        end
    end
    if fft_dac > 0 && fft_dac == fft_dac2
        max_depth = max_depth-1;
        break
    else
        fft_dac2 = fft_dac;
    end
end

% DAC to out
dac_out2 = 0;
for max_depth = 1:100
    dac_out = 0;
    for i = 1:length(root)
        if root{i} == 'dac'
            s = split(leaf{i},' ');
            for j = 2:length(s)
                depth = 1;
                dac_out = depth_first_search(s(j), root, leaf, dac_out, 'out',depth, max_depth);
            end
        end
    end
    if dac_out > 0 && dac_out == dac_out2
        max_depth = max_depth-1;
        break
    else
        dac_out2 = dac_out;
    end
end
dac_out
answer2 = path_fft*fft_dac*dac_out;

fprintf('Answer for part 1: %d \n',paths1)
fprintf('Answer for part 2: %d \n',answer2)

function[paths] = depth_first_search(s,root,leaf,paths,last,depth,max_depth)
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
                paths = depth_first_search(s(j), root,leaf, paths,last,depth+1,max_depth);
            end
        end
    end
end

end
