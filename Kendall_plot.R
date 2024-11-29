################################################################################
# Binary Kendall plot
longer_cor <- data.frame(correlations = c(VI_A$result$kendall_tau,
                                          VI_B$result$kendall_tau,
                                          VI_D$result$kendall_tau,
                                          VI_E$result$kendall_tau),
                         courses     = c(rep("Course A", length(VI_A$result$kendall_tau)),
                                         rep("Course B", length(VI_B$result$kendall_tau)),
                                         rep("Course D", length(VI_D$result$kendall_tau)),
                                         rep("Course E", length(VI_E$result$kendall_tau))))

plot1 <- ggplot(longer_cor, aes(x = correlations, y = fct_rev(courses), fill = courses)) +
  geom_density_ridges(alpha = 0.6, 
                      quantile_lines = TRUE, quantile_fun = function(price,...)mean(price),
                      jittered_points = TRUE,
                      position = position_points_jitter(width = 0.05, height = 0),
                      point_shape = '|', point_size = 3, point_alpha = 1) +
  scale_y_discrete(expand = expand_scale(mult = c(0.04, .4))) +
  theme_bw() + 
  labs(title = "Binary", y = "") + 
  theme(legend.position = "none")

################################################################################
# Binary Kendall plot
longer_cor <- data.frame(correlations = c(VI_A3$result$kendall_tau,
                                          VI_B3$result$kendall_tau,
                                          VI_D3$result$kendall_tau,
                                          VI_E3$result$kendall_tau),
                         courses     = c(rep("Course A", length(VI_A3$result$kendall_tau)),
                                         rep("Course B", length(VI_B3$result$kendall_tau)),
                                         rep("Course D", length(VI_D3$result$kendall_tau)),
                                         rep("Course E", length(VI_E3$result$kendall_tau))))

plot2 <- ggplot(longer_cor, aes(x = correlations, y = fct_rev(courses), fill = courses)) +
  geom_density_ridges(alpha = 0.6, 
                      quantile_lines = TRUE, quantile_fun = function(price, ...) mean(price),
                      jittered_points = TRUE,
                      position = position_points_jitter(width = 0.05, height = 0),
                      point_shape = '|', point_size = 3, point_alpha = 1) + 
  scale_y_discrete(expand = expansion(mult = c(0.04, .4))) +
  theme_bw() + 
  labs(title = "Multiclass", y = "") + 
  theme(legend.position = "none")

################################################################################
cowplot::plot_grid(plot1, plot2, align  = "h")


