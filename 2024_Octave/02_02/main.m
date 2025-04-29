clc;
clear;

## Read data from the input file
reps = dlmread ("./input/input.txt", "emptyvalue", NaN);

## initialise counter for unsafe reports
n_reps_unsafe = 0;

for rep = reps'
    # make the rep a row vector for readability
    rep = rep';

    # remove NaNs in the report
    rep = rep(!isnan (rep));

    # get the number of unsafe differences between levels
    n_levs_unsafe = get_n_levs_unsafe (rep);

    # check if number of unsafe levels is in tolerance
    if (n_levs_unsafe > 1)
        n_reps_unsafe += 1;
    else
        # do nothing
    endif
endfor

## Find the number of safe reports
n_reps_safe = size (reps, 1) - n_reps_unsafe;

## disp the total number of safe reports
disp ("--------------------------------------------");
printf ("Total Number of Safe Reports: %d\n", n_reps_safe);
disp ("--------------------------------------------");
