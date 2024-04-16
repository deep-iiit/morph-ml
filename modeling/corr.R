
data <- cars
x <- data$speed
y <- data$dist
cor.test(x,y)
plot(x,y)
t.test(x,y,p.adjust = "bonferroni")
lmodel <- lm(formula = y~x)
abline(lmodel)
