path <- "placements.csv"
content <- read.csv(path)

#run a regression to check whether there is a statistically significant effect of 
#several variables on placement salary. 
attach(content)
modelo=lm(salary~gender+workex+mba_p+degree_p+ssc_p)
summary(modelo)

#Breusch-Pagan test to check for heteroskedasticity
lmtest::bptest(modelo)

#Checking for graphical evidence of heteroskedasticity
par(mfrow=c(2,2)) 
plot(modelo)

#Testing for multicollinearity
install.packages('car')
library(car)
vif(modelo)

