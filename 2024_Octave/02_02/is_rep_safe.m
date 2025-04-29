function rep_rep = is_rep_safe (rep)
    rep_rep.rep = rep;

    # check input and make sure it is a numerical vector

    # remove non-integer characters

    # get the vector of differences
    rep_rep.diffs = diff (rep);

    # get the vector of absolute differences
    rep_rep.diffs_abs = abs (rep_rep.diffs);

    # look at the minimum differences mask
    rep_rep.mask_min_diff = rep_rep.diffs_abs == 0;
    
    # look at the maximum differences mask
    rep_rep.mask_max_diff = rep_rep.diffs_abs > 3;

    # get sign of each difference
    rep_rep.diffs_sign = sign (rep_rep.diffs);

    # initialise mask of violating diff sign values
    rep_rep.mask_diffs_sign = [];

    ####################
    # Obtaining result #
    ####################

    rep_rep.viols = zeros (3, 1);

    # check the number of violations of minimum difference condition
    rep_rep.viols(1) = sum (rep_rep.mask_min_diff);

    # check the number of violations of maximum difference condition
    rep_rep.viols(2) = sum (rep_rep.mask_max_diff);

    # check the number of violations of changing diff sign according to the
    # majority of diffs that are the same sign
    if (sum (rep_rep.diffs_sign) >= 0) # if the majority of levs are increasing
        # count only those diffs that are decreasing
        rep_rep.mask_diffs_sign = rep_rep.diffs_sign < 0;
        rep_rep.viols(3) = sum (rep_rep.mask_diffs_sign);
    else # if the majority of levs are decreasing
        # count only those diffs that are increasing
        rep_rep.mask_diffs_sign = rep_rep.diffs_sign > 0;
        rep_rep.viols(3) = sum (rep_rep.mask_diffs_sign);
    endif

    # check the number of violations and return safe only if viols is 0
    if (sum (rep_rep.viols) > 0)
        rep_rep.is_safe = false;
    else
        rep_rep.is_safe = true;
    endif
endfunction
