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

    # set the answer to false until proven otherwise
    rep_repairable = false;

    #########################################################################################################
    # look at the minimum differences, maximum differences, and increasing/decreasing gradient changes#
    #########################################################################################################
    
    # 1. set repairable_bool to true if less than or equal to 1 violation of minimum diff;
    # 2. set repairable_bool to true if less than or equal to 2 violations of maximum diff
    # this is because a perturbation can have 2 max diff violations;
    # 3. set repairable_bool to true if less than or equal to 1 violation of gradient changes;

    if (sum (rep_info.viols <= [1; 2; 1]) <= 1)
        rep_repairable = true;
        return;
    endif

    ###################################
    # look at single instance perturbations
    ###################################

    


endfunction
