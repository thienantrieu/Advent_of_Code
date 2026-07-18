%Day 7
clearvars
close all
clc

M = readlines('input_day7.txt');
M(end) = [];
summa = 0;

for k = 1:length(M)
    tosi = 0;
    splitti = split(M(k),':');

    luku = str2double(splitti(1));
    sarja = str2num(splitti(2));
    A = [1 2];

    if mod(length(sarja),2)==0
        A = repmat(A,[1 length(sarja)]);
    else
        A = repmat(A,[1 length(sarja)-1]);
    end
    T = nchoosek(A,length(sarja)-1);
    for i = 1:size(T,1)
        numero = sarja(1);
        for j = 1:size(T,2)
            if T(i,j)==1
                sarja(j+1);
                numero = numero+sarja(j+1);
            elseif numero > luku
                break
            else
                numero = numero*sarja(j+1);
            end
        end
        if luku == numero
            tosi = 1;
            break
        end
    end
    if tosi == 1
        summa = summa + luku;
    end
end

fprintf('%d\n',summa)
%%
clearvars
close all
clc

tic
M = readlines('input_day7.txt');
M(end) = [];
summa = 0;

for k = 1:length(M)
    tosi = 0;
    splitti = split(M(k),':');

    luku = str2double(splitti(1));
    sarja = str2num(splitti(2));
    A = [1 2];


    if mod(length(sarja),2)==0
        A = repmat(A,[1 length(sarja)]);
    else
        A = repmat(A,[1 length(sarja)-1]);
    end
    T = nchoosek(A,length(sarja)-1);
    for i = 1:size(T,1)
        numero = sarja(1);
        for j = 1:size(T,2)
            if T(i,j)==1
                sarja(j+1);
                numero = numero+sarja(j+1);
            elseif numero > luku
                break
            else
                numero = numero*sarja(j+1);
            end
        end
        if luku == numero
            tosi = 1;
            break
        end
        % for j = 1:size(T,2)
            % A = zeros([size(T,2) 1]);
            % B = 2*ones([j 1]);
            % A(1:length(B)) = B;
            % P = unique(perms(A),'rows');
            % for k = 1:size(P,1)
            %     V = T(i,:) + P(k,:);
            %     numero = sarja(1);
            %     for r = 1:length(V)
            %         if numero > luku
            %             break
            %         elseif V(r) == 1
            %            numero = numero + sarja(r+1);
            %         elseif V(r) == 2
            %             numero = numero * sarja(r+1);
            %         else  
            %             numero = strcat(num2str(numero),num2str(sarja(r+1)));
            %             numero = str2double(numero);
            %         end
            %     end
            %     if luku == numero
            %         tosi = 1;
            %         break
            %     end
            % end
            % if tosi == 1
                % break
            % end
        % end
    end
    if tosi == 1
        summa = summa+luku;
    end
end
fprintf('%d\n',summa)
toc
