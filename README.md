# Rashomon effect in Educational Research: Why More is Better Than One for Measuring the Importance of the Variables?

This repository consists of the supplemental materials of the paper "Rashomon effect in Educational Research: Why More is Better Than One for Measuring the Importance of the Variables?" which is submitted to [Journal of Educational Data Mining](https://jedm.educationaldatamining.org/index.php/JEDM/index).


| Task       | Step                                                 | Code                                                                                                                     | Input                                                 | Output |
| ---------- |------------------------------------------------------| ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------- | ------ |
| both       | importing the dataset                                | [data_import.R](https://github.com/mcavs/JEDM_paper/blob/main/data_import.R)                                             | [:file_folder: data](https://github.com/mcavs/JEDM_paper/tree/main/data)|
| binary     | pre-processing the dataset                           | [process_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/process_for_binary.R)                               | []() ||
|            | creating model spaces for each course                | [modeling_with_forester_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/modeling_with_forester_for_binary.R) |||
|            | determining Rashomon sets for each course            | [rashomon_set_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/rashomon_set_for_binary.R)                     |||
|            | explaining the variable importance for Rashomon sets | [explain_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/explain_for_binary.R)                               ||[:file_folder: binary_rds](https://github.com/mcavs/JEDM_paper/tree/main/binary_rds)|
|            | shaping the data from the previous step              | [make_longer_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/make_longer_for_binary.R)                       |||
|            | calculation of the VIOD of the Rashomon sets         | [kendall_for_binary.R](https://github.com/mcavs/JEDM_paper/blob/main/kendall_for_binary.R)                               |||
| multiclass | pre-processing the dataset                           | [process_for_multiclass.R](https://github.com/mcavs/JEDM_paper/blob/main/process_for_multiclass.R)                       |||
|            | creating model spaces for each course                | [modeling_with_forester_for_multiclass.R]()                                                                              |||
|            | determining Rashomon sets for each course            | [rashomon_set_for_multiclass.R](https://github.com/mcavs/JEDM_paper/blob/main/rashomon_set_for_multiclass.R)             |||
|            | explaining the variable importance for Rashomon sets | [explain_for_multiclass.R](https://github.com/mcavs/JEDM_paper/blob/main/explain_for_multiclass.R)                       ||[:file_folder: multiclass_rds](https://github.com/mcavs/JEDM_paper/tree/main/binary_rds)|
|            | shaping the data from the previous step              | [make_longer_for_multiclass.R](https://github.com/mcavs/JEDM_paper/blob/main/make_longer_for_multiclass.R)               |||
|            | calculation of the VIOD of the Rashomon sets         | [kendall_for_multiclass.R](https://github.com/mcavs/JEDM_paper/blob/main/kendall_for_multiclass.R)                       |||
| both       | plot of distributions of the variable importance     | [boxplot.R](https://github.com/mcavs/JEDM_paper/blob/main/code/boxplot.R)                                                ||[Figure 2]()|
|            | plot of distributions of the VIOD                    | [distribution_plot.R](https://github.com/mcavs/JEDM_paper/blob/main/code/distribution_plot.R)                            ||[Figure 3]()|
