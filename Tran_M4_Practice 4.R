#Trang Tran, ALY6010, Module 4, Practice 4
cat("\014")  # clears console
rm(list = ls())  # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) # clears packages
options(scipen = 100) # disables scientific notion for entire R session

library(pacman)
p_load(tidyverse)
p_load(skimr)

install.packages("MASS")
library(MASS)
head(cats)
skim(cats)
summary(cats)

#part 1
#Two-sample t-test with unequal variance
male <- subset(cats, Sex =="M")
female <- subset(cats, Sex =="F")

t.test(male$Bwt, female$Bwt, alternative = "two.sided")

#part 2
#paired t-test
#claim: meditation improves sleeping quality score
before <- data.frame(bef = c(4.6, 7.8, 9.1, 5.6, 6.9, 8.5, 5.3, 7.1, 3.2, 4.4))
after <- data.frame(aft = c(6.6, 7.7, 9.0, 6.2, 7.8, 8.3, 5.9, 6.5, 5.8, 4.9))

#alpha = 0.05
t.test(before$bef, after$aft, paired = TRUE, alternative = "less", conf.level = 0.95)

#alpha = 0.1
t.test(before$bef, after$aft, paired = TRUE, alternative = "less", conf.level = 0.9)
