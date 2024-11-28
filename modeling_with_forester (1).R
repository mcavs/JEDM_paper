#install_github("ModelOriented/forester", force = TRUE)
#library(forester)

model      <- forester::train(data         = data,
                              y            = "final_result",
                              type         = "binary_clf",
                              bayes_iter   = 30,  #20
                              random_evals = 200, #40
                              verbose      = FALSE,
                              parallel     = FALSE,
                              split_seed   = 123)

saveRDS(model, paste0(course_name, "_OULAD_model_forester.rds"))
