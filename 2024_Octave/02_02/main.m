clc;
clear;

## Read data from the input file
reps = dlmread ("./input/input.txt", "emptyvalue", NaN);

## initialise mask for safe reports
reps_is_safe_mask = zeros (size (reps, 1), 1);

for i = 1:(size (reps, 1))
    # make the rep a row vector for readability
    rep = reps(i,:);

    # remove NaNs in the report
    rep = rep(!isnan (rep));

    # get the info of the rep (original)
    rep_info_original = get_rep_info (rep);

    if (rep_info_original.is_safe == true)
        reps_is_safe_mask(i) = true;
    else
        if (is_rep_repairable (rep_info_original) == true)
            reps_is_safe_mask(i) = true;
        else
            reps_is_safe_mask(i) = false;
        endif
    end
endfor

## Find the number of safe reports
n_reps_safe = sum (reps_is_safe_mask);

## disp the total number of safe reports
disp ("--------------------------------------------");
printf ("Total Number of Safe Reports: %d\n", n_reps_safe);
disp ("--------------------------------------------");
