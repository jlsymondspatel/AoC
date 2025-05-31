function rep_repairable = is_rep_repairable_brute (rep_info)

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



    # loop through rep to remove successive elements and test safety
    for i = 1:length (rep_info.rep)
        rm_mask = logical(ones(1,length (rep_info.rep)));
        rm_mask(i) = 0;
        new_rep = rep_info.rep(rm_mask);

        # get info of new rep with removed element
        new_rep_info = get_rep_info (new_rep);

        # test safety
        if (new_rep_info.is_safe == true)
            rep_repairable = true;
            break;
        else
            rep_repairable = false;
            # try next removal loop
        endif
    endfor

endfunction
