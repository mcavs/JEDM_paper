# Rashomon effect in Educational Research: Why More is Better Than One for Measuring the Importance of the Variables?

This repository consists of the supplemental materials of the paper "Rashomon effect in Educational Research: Why More is Better Than One for Measuring the Importance of the Variables?" which is submitted to [Journal of Educational Data Mining](https://jedm.educationaldatamining.org/index.php/JEDM/index).


| Task      | Step                                                 | Code    |
| --------- |------------------------------------------------------| ------- |
| binary    | importing the dataset                                | [](https://github.com/mcavs/JEDM_paper/blob/main/data_import.R)    |
|           | pre-processing the dataset                           | [](https://github.com/mcavs/JEDM_paper/blob/main/process_for_binary.R)    |
|           | creating model spaces for each course                | [](https://github.com/mcavs/JEDM_paper/blob/main/modeling_with_forester_for_binary.R)    |
|           | determining Rashomon sets for each course            | [](https://github.com/mcavs/JEDM_paper/blob/main/rashomon_set_for_binary.R)    |
|           | explaining the variable importance for Rashomon sets | [](https://github.com/mcavs/JEDM_paper/blob/main/explain_for_binary.R)    |
|           | shaping the data from the previous step              | [](https://github.com/mcavs/JEDM_paper/blob/main/make_longer_for_binary.R)    |
|           | calculation of the VIOD of the Rashomon sets         | [](https://github.com/mcavs/JEDM_paper/blob/main/kendall_for_binary.R)    |
| multiclass| importing the dataset                                | []()    |
|           | pre-processing the dataset                           | [](https://github.com/mcavs/JEDM_paper/blob/main/process_for_multiclass.R)    |
|           | creating model spaces for each course                | []()    |
|           | determining Rashomon sets for each course            | [](https://github.com/mcavs/JEDM_paper/blob/main/rashomon_set_for_multiclass.R)    |
|           | explaining the variable importance for Rashomon sets | [](https://github.com/mcavs/JEDM_paper/blob/main/explain_for_multiclass.R)    |
|           | shaping the data from the previous step              | [](https://github.com/mcavs/JEDM_paper/blob/main/make_longer_for_multiclass.R)    |
|           | calculation of the VIOD of the Rashomon sets         | [](https://github.com/mcavs/JEDM_paper/blob/main/kendall_for_multiclass.R)    |
