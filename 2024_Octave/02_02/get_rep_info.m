function rep_info = get_rep_info (rep)
    rep_info.rep = rep;

    # check input and make sure it is a numerical vector

    # remove non-integer characters

    # get the vector of differences
    rep_info.diffs = diff (rep);

    # get the vector of absolute differences
    rep_info.diffs_abs = abs (rep_info.diffs);

    # look at the minimum differences mask
    rep_info.mask_min_diff = rep_info.diffs_abs == 0;
    
    # look at the maximum differences mask
    rep_info.mask_max_diff = rep_info.diffs_abs > 3;

    # get sign of each difference
    rep_info.diffs_sign = sign (rep_info.diffs);

    # initialise mask of violating diff sign values
    rep_info.mask_diffs_sign = [];

    # get the moving pair sum of diffs vector
    rep_info.diffs_moving_pair_sum = sum ([rep_info.diffs(1:(end-1)); rep_info.diffs(2:end)])

    ####################
    # Obtaining result #
    ####################

    rep_info.viols = zeros (3, 1);

    # get the number of violations of minimum difference condition
    rep_info.viols(1) = sum (rep_info.mask_min_diff);

    # get the number of violations of maximum difference condition
    rep_info.viols(2) = sum (rep_info.mask_max_diff);

    # get the number of violations of changing diff sign according to the
    # majority of diffs that are the same sign
    if (sum (rep_info.diffs_sign) >= 0) # if the majority of levs are increasing
        # count only those diffs that are decreasing
        rep_info.mask_diffs_sign = rep_info.diffs_sign < 0;
        rep_info.viols(3) = sum (rep_info.mask_diffs_sign);
    else # if the majority of levs are decreasing
        # count only those diffs that are increasing
        rep_info.mask_diffs_sign = rep_info.diffs_sign > 0;
        rep_info.viols(3) = sum (rep_info.mask_diffs_sign);
    endif

endfunction

