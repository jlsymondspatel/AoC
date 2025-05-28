function rep_repairable = is_rep_repairable (rep_info)
    ###################################
    # check if nothing to do
    ###################################
    if (rep_info.is_safe == true)
        rep_repairable = NaN;
        return;
    else
        # do nothing
    endif

    ###################################
    # look at the minimum differences #
    ###################################
    
    # set repairable_bool to 0 if more than 1 violation of minimum diff
    if (rep_info.viols(1) > 1)
        rep_repairable = false;
        return;
    else
        # do nothing
    endif
    
    ###################################
    # look at the maximum differences
    ###################################

    # set repairable_bool to 0 if more than 2 violations of maximum diff
    # this is because a perturbation can have 2 max diff violations
    if (rep_info.viols(2) > 2)
        rep_repairable = false;
        return;
    else
        # do nothing
    endif

    ###################################
    # look at increasing/decreasing gradient changes
    ###################################

    # set repairable_bool to 0 if more than 1 violation of gradient changes
    if (rep_info.viols(3) > 1)
        rep_repairable  = false;
        return;
    else
        # do nothing
    endif

    ###################################
    # look at single instance perturbations
    ###################################

    


endfunction
