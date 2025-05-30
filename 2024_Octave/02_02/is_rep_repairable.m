function rep_repairable = is_rep_repairable (rep_info)

    ###################################
    # check if nothing to do
    ###################################

    # if rep is already safe or the length of rep is 1 do nothing -
    # repairability is N/A
    if ((rep_info.is_safe == true) || (length (rep_info.rep) <= 1))
        rep_repairable = NaN;
        return;
    endif

    # if rep is less 2 elems long, then is repairable
    if (length (rep_info.rep) == 2)
        rep_repairable = true;
        return;
    endif

    # set the answer to false until proven otherwise
    rep_repairable = false;

    # set repair limit
    repair_lim = 1;

    for i = 1:repair_lim
        [is_repair_successful, new_rep] = try_one_repair (rep_info);

        if (is_repair_successful == true)
            rep_info = get_rep_info (new_rep);
        else
            break;
        endif

        if (rep_info.is_safe == true)
            rep_repairable = true;
            break;
        endif
    endfor

endfunction
