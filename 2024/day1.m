%Day 1
clearvars
close all
clc

l = readmatrix('input_day1.txt');

l1 = l(:,1);
l2 = l(:,2);

ls1 = sort(l1);
ls2 = sort(l2);
sum(abs(ls2-ls1))

%part 2
luku = 0;
for i = 1:1000
    samat = 0;
    for j =1:1000
        if l1(i)==l2(j)
            samat=samat+1;
        end
    end
    luku = luku+samat*l1(i);
end
luku

