# reference model
rashomon_set3 <- function(model){
  max_acc_model   <- which.max(model$score_test$accuracy)
  ref_model_name  <- model$score_test$name[max_acc_model]
  ref_model       <- model$models_list[[ref_model_name]]
  
  rash_set_ind    <- which(model$score_test$accuracy > model$score_test$accuracy[max_acc_model] - 0.05)
  rash_set_ind    <- rash_set_ind[rash_set_ind != max_acc_model]
  rash_model_name <- model$score_test$name[rash_set_ind]
  rash_set        <- lapply(rash_model_name, function(name) model$models_list[[name]])
  return(list(ref_model_name       = ref_model_name,
              ref_model            = ref_model,
              ref_f1               = model$score_test$weighted_f1[max_acc_model],
              ref_acc              = model$score_test$accuracy[max_acc_model],
              ref_model_id         = max_acc_model,
              rash_set_ids         = rash_set_ind,
              rash_set_model_names = rash_model_name,
              rash_f1              = model$score_test$weighted_f1[rash_set_ind],
              rash_acc             = model$score_test$accuracy[rash_set_ind],
              rash_set_models      = rash_set,
              models               = model))
}

