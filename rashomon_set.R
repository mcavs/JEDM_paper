# reference model
rashomon_set <- function(model){
  max.auc.model    <- which.max(model$score_test$auc)
  ref_model_name   <- model$score_test$name[max.auc.model]
  ref_model        <- model$models_list[[ref_model_name]]
  ref_model_labels <- as.numeric(unlist(model$predictions_test_labels[ref_model_name]))
  
  rash_set_ind     <- which(model$score_test$auc > model$score_test$auc[max.auc.model] - 0.05)
  rash_set_ind     <- rash_set_ind[rash_set_ind != max.auc.model]
  rash_model_name  <- model$score_test$name[rash_set_ind]
  rash_set         <- lapply(rash_model_name, function(name) model$models_list[[name]])
  rash_set_labels  <- lapply(rash_model_name, function(name) model$predictions_test_labels[[name]])
  rash_set_labels  <- as.data.frame(do.call(cbind, rash_set_labels))
  rash_set_labels  <- as.data.frame(lapply(rash_set_labels, as.numeric))
  
  return(list(ref_model_name       = ref_model_name,
              ref_model            = ref_model,
              ref_auc              = max(model$score_test$auc),
              ref_acc              = model$score_test$accuracy[max.auc.model],
              ref_model_id         = max.auc.model,
              ref_model_labels     = ref_model_labels,
              rash_set_ids         = rash_set_ind,
              rash_set_model_names = rash_model_name,
              rash_auc             = model$score_test$auc[rash_set_ind],
              rash_acc             = model$score_test$accuracy[rash_set_ind],
              rash_set_models      = rash_set,
              rash_set_labels      = rash_set_labels,
              models               = model))
}


