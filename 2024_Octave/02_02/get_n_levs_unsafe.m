function unsafe_levs = get_n_levs_unsafe (rep)
    # check input and make sure it is a numerical vector

    # remove non-integer characters

    # get the vector of differences
    lev_diffs = diff (rep);

    # get the vector of absolute differences
    lev_diffs_abs = abs (diff (rep));

    # mark the levels that jump by more than 3 or less than 1 (absolutely) in a bit mask
    levs_unsafe_mask = lev_diffs_abs > 3;
    levs_unsafe_mask = levs_unsafe_mask | lev_diffs_abs < 1;

    # get the sign of the level differences in order to check changing gradients
    lev_diffs_sign = sign (lev_diffs);
    
    # mark odd gradient changes as unsafe
    if (sum (lev_diffs_sign) >= 0) # if the majority of levs are increasing
        levs_unsafe_mask = levs_unsafe_mask | (lev_diffs_sign < 0);
    else # if the majority of levs are decreasing
        levs_unsafe_mask = levs_unsafe_mask | (lev_diffs_sign > 0);
    endif
   
    # return the number of unsafe levels
    unsafe_levs = sum (levs_unsafe_mask);

endfunction
