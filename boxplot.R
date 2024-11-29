longer_imp <- rbind(longer_impA, longer_impB, longer_impD, longer_impE)
longer_imp <- data.frame(course = c(rep("Course A", dim(longer_impA)[1]),
                                    rep("Course B", dim(longer_impB)[1]),
                                    rep("Course D", dim(longer_impD)[1]),
                                    rep("Course E", dim(longer_impE)[1])),
                         longer_imp)

# facet boxplot
ggplot(longer_imp, aes(y = as.factor(V), x = I, fill = as.factor(V))) +
  geom_boxplot(staplewidth = 0.5, outliers = FALSE) +
  labs(x = "drop AUC loss", y = "") + 
  theme_bw() + 
  theme(legend.position = "none") + 
  facet_wrap(~ course, ncol = 1, scales = "free_x")

