% Day 8
clearvars
close all
clc

M = readmatrix('input_day8.txt');

distance = zeros(size(length(M),length(M)));

% Distance matrix
for i = 1:length(M)
    for j = 1:length(M)
        if norm(M(i,:)-M(j,:)) ~= 0
            distance(i,j) = norm(M(i,:)-M(j,:));
        else
            distance(i,j) = inf;
        end
    end
end

[~,i] = sort(distance(:));

% Remove duplicate distances
i = i(1:2:end);
numbers = [];

for j = 1:length(i)
    k = i(j);
    if mod(k,length(M)) == 0
        numbers(end+1) = length(M);
    else
        numbers(end+1) = mod(k,length(M));
    end
    numbers(end+1) = ceil(k/length(M));
    numbers = unique(numbers);
    if length(numbers) >= length(M)
        % if all numbers are paired then stop
        last_i = i(j);
        break
    end
end

circuit_size = kruskal(M,1000,2, distance);

% Pair corresponding to index in distance array
if mod(last_i,length(M)) == 0
    last_mod = length(M);
else
    last_mod = mod(last_i,length(M));
end

last_pair = [ceil(last_i/length(M)), last_mod];

x1 = M(last_pair(1),:);
x2 = M(last_pair(2),:);

fprintf('Answer for part 2: %d \n',prod([x1(1),x2(1)]))


function [circuit_sizes] = kruskal(M,connections,connection_confirms,distance)

[~,i] = sort(distance(:));

% Jump over duplicate distances
j = i(1:2:2*connections);

modulo = [];
% if mod(x,length(M)) = 0 it is the last value in list
for i = 1:length(j)
    if mod(j(i),length(M)) == 0
        modulo(end+1) = length(M);
    else
        modulo(end+1) = mod(j(i),length(M));
    end
end

% Pair connections
simple_circuit = sortrows([ceil(j/length(M)), modulo']);

% Make all boxes as connections
circuit = {};
for i = 1:length(M)
    circuit{i} = i;
end

% Add more connections as union
% Make sure that all are connected

% Connecting pair to circuit
for i = 1:length(circuit)
    for j = 1:size(simple_circuit,1)
        if any(ismember(circuit{i}, simple_circuit(j,:)))
            circuit{i} = union(circuit{i}, simple_circuit(j,:));
        end
    end
end

% Interconnection in circuit array
for k = 1:connection_confirms
    for i = 1:length(circuit)
        for j = 1:length(circuit)
            if any(ismember(circuit{i}, circuit{j}))
                circuit{i} = union(circuit{i}, circuit{j});
            end
        end
    end
end

% Remove duplicate connections from cell
for i = 1:length(circuit)
    for j = i+1:length(circuit)
        if any(ismember(circuit{i},circuit{j}))
            circuit{j} = '';
        end
    end
end

% Initiate matrix with circuit lengths and quantity
circuit_sizes = [];
for i = 1:length(circuit)
    circuit_sizes(end+1) = length(circuit{i});
end

circuit_sizes = sort(unique(circuit_sizes),'descend');
circuit_sizes(2,:) = zeros(length(circuit_sizes),1);

for i = 1:length(circuit)
    add_index = find(circuit_sizes(1,:) == length(circuit{i}));
    circuit_sizes(2,add_index) = circuit_sizes(2,add_index) + 1;
end

fprintf('Answer for part 1: %d \n',prod(circuit_sizes(1,1:3)))
end