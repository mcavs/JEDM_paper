calculate_kendall <- function(data) {
  ref_model <- data$model[which.max(data$acc)]
  
  data_ranked <- data |>
    group_by(model) |>
    arrange(desc(I), .by_group = TRUE) |>
    mutate(rank = row_number()) |>
    select(model, V, rank, I) |>
    ungroup()
  
  ref_model_ord  <- data_ranked$V[data_ranked$model == ref_model]
  ref_model_rank <- data_ranked$rank[data_ranked$model == ref_model]
  
  data_ordered <- data_ranked |>
    mutate(V = factor(V, levels = ref_model_ord)) |>
    arrange(model, V) |>
    ungroup()
  
  kendall_tau_scores <- list()
  for (current_model in unique(data_ordered$model)) {
    current_model_rank <- data_ordered |>
      filter(model == current_model) |>
      pull(rank)
    
    kendall_tau <- cor(ref_model_rank, current_model_rank, method = "kendall")
    kendall_tau_scores[[current_model]] <- kendall_tau
  }
  
  result <- data.frame(
    model       = names(kendall_tau_scores),
    kendall_tau = unlist(kendall_tau_scores))
  rownames(result) <- NULL
  result           <- result[-1,]
  return(list(result     = result,
              mean_sim   = mean(result$kendall_tau),
              max_dissim = min(result$kendall_tau)))
}
