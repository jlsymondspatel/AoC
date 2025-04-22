clc;
clear;

## Read data from the input file
loc_ids = dlmread ("./input/input.txt");

## sort the columns of the data
loc_ids_sorted = sort (loc_ids);

## find the absolute differences between columns
loc_ids_abs_diffs = abs (diff (loc_ids_sorted, 1, 2));

## find the sum of the absolute differences
loc_ids_diffs_sum = sum (loc_ids_abs_diffs);

## print result
disp ("The sum of the sorted location ID differences is:");
disp (loc_ids_diffs_sum);
