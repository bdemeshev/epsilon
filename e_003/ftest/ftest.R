
# эксперимент с F-тестом

# проверить разные варианты с работой по максимуму из двух F-распределений

df1 <- 40
df2 <- 20
n <- 10 ^ 7

x <- rf(n = n, df1 = df1, df2 = df2)
z <- rchisq(n = n, df = df1)
y <- rchisq(n = n, df = df2)
xx <- pmax((z / df1) / (y / df2), (y / df2) / (z / df1))

dfmax <- ifelse((z / df1) / (y / df2) > 1, df1, df2)
dfmin <- ifelse((z / df1) / (y / df2) > 1, df2, df1)


sum(x > qf(0.95, df1 = df1, df2 = df2)) / n
sum(xx > qf(0.95, df1 = dfmax, df2 = dfmin)) / n / 2
