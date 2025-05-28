function rep_safe = is_rep_safe (rep_info)
    # check the number of violations and return safe only if viols is 0
    if (sum (rep_info.viols) > 0)
        rep_info.is_safe = false;
    else
        rep_info.is_safe = true;
    endif

    # return answer
    rep_safe = rep_info.is_safe;
endfunction
