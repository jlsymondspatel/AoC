clc;
clear;

## Read data from the input file
reps = dlmread ("./input/input.txt", "emptyvalue", NaN);

## Find the differences of levels in each report
level_diffs = diff (reps, 1, 2);

## Find the maximum and minimum absolute level difference
level_diffs_abs_max = max (abs (level_diffs), [], 2);
level_diffs_abs_min = min (abs (level_diffs), [], 2);

## Find the reports that have a max abs level diff greater than +-3, min lower
## than +-1
reps_unsafe = (level_diffs_abs_max > 3) | (level_diffs_abs_min < 1);

## Find the reports that have changing directions of differences and include
## them in unsafe report mask
level_diffs_max = max (level_diffs, [], 2);
level_diffs_min = min (level_diffs, [], 2);
reps_unsafe = reps_unsafe | (sign (level_diffs_max) != sign (level_diffs_min));

## Find the number of safe reports
reps_safe = (size (reps, 1)) - (sum (reps_unsafe));

## disp the total number of safe reports
disp ("--------------------------------------------");
printf ("Total Number of Safe Reports: %d\n", reps_safe);
disp ("--------------------------------------------");
