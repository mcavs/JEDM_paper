make_longer <- function(data){
  longer_data <- data |>
    arrange(desc(auc)) |>
    pivot_longer(cols = starts_with("V"), names_to = "V_type", values_to = "V") |>
    pivot_longer(cols = starts_with("I"), names_to = "I_type", values_to = "I") |>
    mutate(V_index = as.numeric(gsub("\\D", "", V_type)),
           I_index = as.numeric(gsub("\\D", "", I_type))) |>
    filter(V_index == I_index) |>
    select(model, auc, acc, V, I)
  
  return(longer_data)
}


