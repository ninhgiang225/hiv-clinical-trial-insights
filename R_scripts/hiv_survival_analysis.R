library(survival)
library(survminer)
amp <- read.csv("amp.csv")

# check structure
str(amp)
Surv(amp$hiv1survday, amp$hiv1event)
summary(amp)
table(amp$hiv1event)
table(amp$tx)
table(amp$tx_pool)
summary(amp$hiv1survday)
summary(amp$age)
table(amp$protocol)
table(amp$country)

#converts tx_pool, tx, protocol into categorical variables
amp$tx_pool_f <- factor(amp$tx_pool, levels = c(1, 0),labels = c("Placebo", "VRC01"))
amp$tx_f <- factor(amp$tx,levels = c("C3", "T1", "T2"),labels = c("Placebo", "Low dose", "High dose"))
amp$protocol_f <- factor(amp$protocol)
Surv(amp$hiv1survday, amp$hiv1event)
nrow(amp)
table(amp$hiv1event)
prop.table(table(amp$hiv1event))

#treatment groups
table(amp$tx_pool_f)
prop.table(table(amp$tx_pool_f))

#infection by treatment
table(amp$tx_pool_f, amp$hiv1event)
prop.table(table(amp$tx_pool_f, amp$hiv1event), 1)

#treatment distribution
barplot(table(amp$tx_pool_f),main = "Distribution of Treatment Groups", ylab = "Number of Participants",col = c("white", "grey"))

#infection rate by treatment
prop_table <- prop.table(table(amp$tx_pool_f, amp$hiv1event), 1)
barplot(t(prop_table),beside = TRUE,legend = c("No HIV", "HIV"),col = c("white", "grey"), main = "HIV Infection by Treatment Group",ylab = "Proportion")

#age distribution
hist(amp$age,main = "Age Distribution",xlab = "Age",col = "lightgray",breaks = 20)

#age by treatment
boxplot(age ~ tx_pool_f,data = amp,main = "Age by Treatment Group",xlab = "Treatment",ylab = "Age",col = c("white", "grey"))

#kaplan meier curve for each treatment
km_fit <- survfit(Surv(hiv1survday, hiv1event) ~ tx_pool_f, data = amp)
plot(km_fit,col = c("red", "blue"),lwd = 2,xlab = "Days",ylab = "Probability of Remaining HIV-Free",main = "Kaplan-Meier Survival Curves by Treatment", ylim = c(0.9, 1))
legend("bottomleft",legend = c("Placebo", "VRC01"),col = c("red", "blue"),lwd = 2)

#log-rank test
survdiff(Surv(hiv1survday, hiv1event) ~ tx_pool_f, data = amp)

#fit the first Cox model (treatment only)
cox1 <- coxph(Surv(hiv1survday, hiv1event) ~ tx_pool_f, data = amp)
summary(cox1)

#fit the second Cox model (split treatment into high and low dose)
cox2 <- coxph(Surv(hiv1survday, hiv1event) ~ tx_f, data = amp)
summary(cox2)

#fit the third Cox model ()
cox3 <- coxph(Surv(hiv1survday, hiv1event) ~ tx_f + age + region1 + region2 + region3,data = amp)
summary(cox3)

#interaction effect
cox_int <- coxph(Surv(hiv1survday, hiv1event) ~ tx_f * age + region1 + region2 + region3,data = amp)
summary(cox_int)

#ph assumptions of model 3
cox.zph(cox3)
plot(cox.zph(cox3))
