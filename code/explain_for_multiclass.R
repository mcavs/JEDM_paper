# install.packages("DALEX") 
# library(DALEX)

importance_order3 <- function(rashomon_set){
  
  ref_model_name        <- rashomon_set$ref_model_name
  models                <- rashomon_set$models
  rash_set_ids          <- rashomon_set$rash_set_ids
  ref_model_id          <- rashomon_set$ref_model_id
  rash_set_model_names  <- rashomon_set$rash_set_model_names 
  ref_f1                <- rashomon_set$ref_f1
  rash_f1               <- rashomon_set$rash_f1
  ref_acc               <- rashomon_set$ref_acc
  rash_acc              <- rashomon_set$rash_acc
  
  model_ids             <- c(ref_model_id, rash_set_ids)
  model_names           <- c(ref_model_name, rash_set_model_names)
  model_f1              <- c(ref_f1, rash_f1)
  model_acc             <- c(ref_acc, rash_acc)
  
  rash_imp_order        <- NULL
  rash_imp_dif          <- NULL
  
  for(i in 1:length(model_ids)){
    model_name          <- model_names[i] 
    data_name           <- if (grepl("xgboost", model_name)) {"xgboost_data"
    } else if (grepl("ranger", model_name)) {"ranger_data"
      } else if (grepl("decision", model_name)) {"decision_tree_data"
          } else {"lightgbm_data"}
    
    data_input          <- eval(parse(text = paste("models$test_data$", data_name, sep = "")))
    
    if(data_name %in% c("ranger_data", "decision_tree_data")){
      data_input        <- data_input[,-7]}
    
    explainer           <- DALEX::explain(model     = models$models_list[[model_name]],
                                          data      = data_input,
                                          y         = models$test_observed,
                                          task      = "multiclass",
                                          verbose   = FALSE)
    
    rash_imp_raw        <- DALEX::model_parts(explainer, type = "raw")
    rash_imp_diff       <- DALEX::model_parts(explainer, type = "difference")
    rash_imp_order[[i]] <- rev(rash_imp_raw$variable[2:(dim(explainer$data)[2] + 1)])
    rash_imp_dif[[i]]   <- rev(rash_imp_diff$dropout_loss[2:(dim(explainer$data)[2] + 1)])
  }
  
  list_df                <- lapply(rash_imp_order, 
                                   function(x) as.data.frame(t(x), stringsAsFactors = FALSE))
  list_dif               <- lapply(rash_imp_dif, function(x) as.data.frame(t(x)))
  rash_imp_dif           <- do.call(rbind, list_dif)
  colnames(rash_imp_dif) <- c("I1", "I2", "I3", "I4", "I5", "I6")
  rash_imp_order         <- do.call(rbind, list_df)
  rash_imp_order         <- cbind(model = model_names, f1 = model_f1,  acc = model_acc, rash_imp_order, rash_imp_dif)
  return(rash_imp_order)
}

#importance_order3(rasho)

