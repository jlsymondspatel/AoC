clc;
clear;

## Read data from the input file
locs = dlmread ("./input/input.txt");

## split the lists into two
lhs = sort (locs)(:,1);
rhs = sort (locs)(:,2);

## set similarity score to 0
sim_score = 0;

## go through each row of the lhs in a for loop, where the value at each successive row is "i"
for i = lhs'
    ## create logical array mask for all values equal to "i"
    mask = (rhs == i);

    ## count the number of all values equal to "i"
    i_sum = sum (mask);

    ## increase similarity score
    sim_score += (i_sum * i);
endfor

## display similarity score
disp ("--------------------------------------------");
printf ("Similarity Score: %d\n", sim_score);
disp ("--------------------------------------------");
