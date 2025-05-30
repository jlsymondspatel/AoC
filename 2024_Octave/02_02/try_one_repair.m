function [is_repair_successful, new_rep] = try_one_repair (rep_info)
    ###################################
    # look at repairs starting from either end
    ###################################

    # if the first and last difference is violating conditions, and has no neighbouring violations,
    # the offer free repair (taking of the last element)
    if (rep_info.mask_viols(1:2) == [1, 0])
        is_repair_successful = true;
        new_rep = rep_info.rep;
        new_rep(1) = [];
        return;
    endif

    if (rep_info.mask_viols((end-1):end) == [0, 1])
        is_repair_successful = true;
        new_rep = rep_info.rep;
        new_rep(end) = [];
        return;
    endif

    #####################################################
    # look at repairs within the other elements of report
    #####################################################

    # loop through mask_viols and try to remove violations depending on presence of corresponding
    # pair sum that meets conditions (mask_diffs_moving_pair_sum)
    for i = [1:(length (rep_info.mask_viols)-1)]
        if (rep_info.mask_viols(i) == 0)
            # do nothing
        else
            if (rep_info.mask_viols(i+1) == 1)
                if (rep_info.mask_diffs_moving_pair_sum(i) == 1)
                    # remove element i+1 and return successful repair
                    is_repair_successful = true;
                    new_rep = rep_info.rep;
                    new_rep(i+1) = [];
                    return;
                else
                    # return unsuccessful repair
                    is_repair_successful = false;
                    new_rep = NaN;
                    return;
                endif
            else
                # if current viol is the only one, then look for available moving pair sum of diff
                if (rep_info.mask_diffs_moving_pair_sum(i) == 1)
                    # remove element i+1 and return successful repair
                    is_repair_successful = true;
                    new_rep = rep_info.rep;
                    new_rep(i+1) = [];
                    return;
                elseif (rep_info.mask_diffs_moving_pair_sum(i-1) == 1)
                    # remove element i and return successful repair
                    is_repair_successful = true;
                    new_rep = rep_info.rep;
                    new_rep(i) = [];
                    return;
                else
                    # return unsuccessful repair
                    is_repair_successful = false;
                    new_rep = NaN;
                    return;
                endif
            endif
        endif
    endfor
endfunction
