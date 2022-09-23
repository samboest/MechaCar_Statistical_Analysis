# Deliverable 1

library(tidyverse)

mchar_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

#Multi-R - Analysis

lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=mchar_table) #generate multiple linear regression model

summary(lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length,data=mchar_table)) #generate summary statistics

#Deliverable 2

sus_table <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

#total summary

total_summary <- sus_table %>% summarize(Mean=mean(PSI),Median=max(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') 

#lot summary

lot_summary <- sus_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=max(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns


#DELIVERABLE 3

#part 1

t.test(sus_table$PSI,mu=1500) #compare sample versus population means

#part 2

t.test(subset(sus_table, sus_table$Manufacturing_Lot == "Lot1")$PSI,mu=1500)

t.test(subset(sus_table, sus_table$Manufacturing_Lot == "Lot2")$PSI,mu=1500)

t.test(subset(sus_table, sus_table$Manufacturing_Lot == "Lot3")$PSI,mu=1500)