%Day 24
clearvars
close all
clc

L = readlines('input_day24.txt');
L(end) = [];
X = {};

jako = find(L=='');

A = L(1:jako-1);
B = L(jako+1:end);

splitti = split(B(1),' -> ');
X{end+1} = [splitti(2),inf];


for i = 1:length(B)
    splitti = split(B(i),' -> ');
    if contains(B(i),'AND')
        s = split(splitti(1),' AND ');

        X = sijoitus(X,splitti,s);
    elseif contains(B(i),'XOR')
        s = split(splitti(1),' XOR ');

        X = sijoitus(X,splitti,s);        
    elseif contains(B(i),'OR')
        s = split(splitti(1),' OR ');
        X = sijoitus(X,splitti,s);
    end
end

for i = 1:length(A)
    splitti = split(A(i),': ');
    for j = 1:length(X)
        if contains(X{j}(1),splitti(1))
            X{j}(2) = splitti(2);
        end
    end
end

for i = 1:47
    X = paiva24(X,B);
end

Z = [];
for i = 1:length(X)
    if contains(X{i}(1),'z')
        Z(:,end+1) = [regexp(X{i}(1),'\d+','match'); str2double(X{i}(2))];
    end
end

[~,d] = sort(Z(1,:),'descend');
luku = Z(2,d);

fprintf('%d\n',bin2dec(num2str(luku)))

function[X] = paiva24(X,B)
for i = 1:length(B)
    tosi = 0;
    splitti = split(B(i),' -> ');

    if contains(B(i),'AND')
        s = split(splitti(1),' AND ');

        for j = 1:length(X)
            if contains(X{j}(1),s(1))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    a = X{j}(2);
                end
            end
            if contains(X{j}(1),s(2))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    b = X{j}(2);
                end
            end
        end
        if tosi == 0
            for j = 1:length(X)
                if contains(X{j}(1),splitti(2)) 
                    X{j}(2) = bitand(str2double(a),str2double(b));
                    break
                end
            end
        end
    elseif contains(B(i),'XOR')
        s = split(splitti(1),' XOR ');

        for j = 1:length(X)
            if contains(X{j}(1),s(1))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    a = X{j}(2);
                end
            end
            if contains(X{j}(1),s(2))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    b = X{j}(2);
                end
            end
        end
        if tosi == 0
            for j = 1:length(X)
                if contains(X{j}(1),splitti(2)) 
                    X{j}(2) = bitxor(str2double(a),str2double(b));
                    break
                end
            end
        end
    elseif contains(B(i),'OR')
        s = split(splitti(1),' OR ');

        for j = 1:length(X)
            if contains(X{j}(1),s(1))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    a = X{j}(2);
                end
            end
            if contains(X{j}(1),s(2))
                if contains(X{j}(2),'Inf')
                    tosi = 1;
                    break
                else
                    b = X{j}(2);
                end
            end
        end
        if tosi == 0
            for j = 1:length(X)
                if contains(X{j}(1),splitti(2))
                    X{j}(2) = bitor(str2double(a),str2double(b));
                    break
                end
            end
        end
    end
end
end

function[X] = sijoitus(X,splitti,s)
tosi1 = 0;
tosi2 = 0;
tosi3 = 0;
for j = 1:length(X)
    if contains(X{j}(1),splitti(2))
        tosi1 = 1;
    end
    if contains(X{j}(1),s(1))
        tosi2 = 1;
    end
    if contains(X{j}(1),s(2))
        tosi3 = 1;
    end
end
if tosi1 == 0
    X{end+1} = [splitti(2),inf];
end
if tosi2 == 0
    X{end+1} = [s(1),inf];
end
if tosi3 == 0
    X{end+1} = [s(2),inf];
end
end
