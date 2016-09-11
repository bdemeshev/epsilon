data <- read.csv("overfit.csv")

mod1 <- lm(uspop ~ poly(year, 7), data=data)
summary(mod1)
new <- data.frame(year = 1900:2040)
pr <- predict(mod1, new)

pdf("overfit.pdf", width=6, height=5)
plot(data$year[seq(1, length(data$year), 3)], data$uspop[seq(1, length(data$year), 3)],
     xlim=c(1900, 2040), xlab="Year", ylab="US population", main="Polynomial fit (d = 7)", cex=1)
lines(new$year, pr, lwd=1.5)
dev.off()
