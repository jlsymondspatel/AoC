function ones_adjacent = is_ones_adjacent (log_row_vec)
  ones_adjacent = false;

  log_row_vec_mat =[log_row_vec(1:(end-1)); log_row_vec(2:end)];

  for i = log_row_vec_mat
    if (all (i))
      ones_adjacent = true;
      return;
    endif
  endfor

endfunction
