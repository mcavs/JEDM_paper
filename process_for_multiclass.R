data <- dataset |>
  drop_na() |>
  filter(final_result != "Withdrawn") |>
  select(gender, region, highest_education, imd_band, age_band, disability, final_result) |>
  mutate(age_band          = as.numeric(as.factor(age_band))) |>
  mutate(imd_band          = as.numeric(as.factor(imd_band))) |>
  mutate(highest_education = as.numeric(as.factor(highest_education))) |>
  mutate(region            = as.numeric(as.factor(region))) |>
  mutate(gender            = as.numeric(as.factor(gender))) |>
  mutate(disability        = as.numeric(as.factor(disability))) |>
  mutate(final_result      = ifelse(final_result == "Distinction", 3, 
                                    ifelse(final_result == "Pass", 2, 1))) 
