insark <- read.csv2("~/Dropbox/A5HT19/Lectures/Data/conscriptiondata.csv")
n <- 1000
set.seed(12345)
df <- insark[sample(insark$id, n), ]
df$sbp130 <- NA
df$sbp130[df$sbp >= 130] <- 1
df$sbp130[df$sbp < 130] <- 0
df$dbp80 <- NA
df$dbp80[df$dbp >= 80] <- 1
df$dbp80[df$dbp < 80] <- 0
df$testa30 <- NA
df$testa30[df$testa >= 30] <- 1
df$testa30[df$testa < 30] <- 0
df$testb30 <- NA
df$testb30[df$testb >= 30] <- 1
df$testb30[df$testb < 30] <- 0
df$testc30 <- NA
df$testc30[df$testc >= 30] <- 1
df$testc30[df$testc < 30] <- 0
df$testd30 <- NA
df$testd30[df$testd >= 30] <- 1
df$testd30[df$testd < 30] <- 0
df$psych_low <- NA 
df$psych_low[df$psych <= 2] <- 1
df$psych_low[df$psych > 2] <- 0
df$psych_med <- NA 
df$psych_med[ (df$psych > 2) | (df$psych <= 7)] <- 1
df$psych_med[ (df$psych <= 2) | (df$psych > 7)] <- 0
df$psych_high <- NA 
df$psych_high[df$psych >= 8] <- 1
df$psych_high[df$psych < 8] <- 0
df$psych_3cat <- NA
df$psych_3cat[df$psych <=2] <- 1
df$psych_3cat[ (df$psych > 2) & (df$psych <= 7)] <- 2
df$psych_3cat[df$psych >= 8] <- 3


# Sannolikheter som är mindre än 0 och större än 1
m1 <- lm(testc30 ~ height, data = df)
Ey1x155 <- m1$coefficients[1] + m1$coefficients[2]*130 
# Icke-konstant varians
m2 <- lm(testc30 ~ psych_med + psych_high, data = df)
summary(m2)
table(df$testc30, df$psych_3cat)




m0 <- glm(testc30 ~  testb30, data = df, family = "binomial")
summary(m0)
m0_OR <- exp(m0$coefficients)
m0_OR
exp(confint.default(m0))

table1 <- table(df$testc30, df$testb30)
rownames(table1) <- c("Test c: < 30 ", "Test c: 30 or more")
colnames(table1) <- c("Test b: < 30", "Test b: 30 or more")
p_testc_high_test_b_high <- table1[2,2]/(table1[2,2] + table1[1,2])
p_testc_high_test_b_low <- table1[2,1]/(table1[2,1] + table1[1,1])
OR <- ( p_testc_high_test_b_high/(1 - p_testc_high_test_b_high) ) /
      ( p_testc_high_test_b_low/( 1- p_testc_high_test_b_low ) )
SElnOR <- sqrt(sum(1/table1))
LL <- exp(log(OR) - 1.96*SElnOR)
UL <- exp(log(OR) + 1.96*SElnOR)
LL
UL
Z <- log(OR)/SElnOR
p.value <- 2*(1-pnorm(abs(Z)))
  
  
m1 <- glm(testc30 ~ testa30 + testb30 + testd30 + 
          muscle + height + weight + sbp130 + dbp80 +
          psych_high + psych_med + physical + legstrength, 
          data = df, 
          family = "binomial")
summary(m1)

m1_OR <- exp(m1$coefficients)
m1_OR
confint(m1)
confint.default(m1)


