# Studie av samplingfördelning för stickprovsmedelvärdet

# Välj ändlig fördelning för variabeln x
  N <- 20000
# Normalfördelning med medelvärde mu och populationsvarians sigma
  mu <- 1
  sigma2 <- 2
  x_pop <- rnorm(N, mean = mu , sd = sqrt(sigma2) )
  mu <- mean(x_pop)
  sigma2 <- var(x_pop)
  hist(x, breaks = 40)

# Ta fram samplingfördelning.
n <- 100
B <- 10000
xbar <- rep(NA)
for(i in 1:B){
 x_sample <- sample(x_pop, n, replace = FALSE)
 xbar[i] <- mean( x_sample )
 print(i)
}

hist(xbar, freq = FALSE, breaks=40)
mu
mean(xbar)
var(xbar)
vxbar <- ( (N-n)/(N-1) )*sigma2/n
vxbar
curve( dnorm(x, mu, sqrt(vxbar)), min(xbar), max(xbar), add=TRUE, col="red" )

      
# 
par(mfrow=c(2,1))
hist(x)



#------------------------------------------------------------------------
### Make it even prettier
hist(x, main = "Grade Point Average", xlab = "GPA in 9th grade",
     density = 10, col = "blue", breaks = 12, probability = TRUE)
#------------------------------------------------------------------------
### And now get overly fancy to show how to add a neat legend and distribution.  
# I know that the mean and variance are 2.45 and 0.74
meanvalue <- expression(paste(bar(x) == 2.45))  # set this up to write out
variance <- expression(s^2 == 0.74)                  # nice text using symbols
legend(1,0.7, c(meanvalue, variance))                # The first two entries are X and Y coordinates (1 and 0.7)                               
lines(density(x), col = "red")                     # Fit a "best fitting" curve




# Välj ändlig fördelning för variabeln x
N <- 20000
# Expontentialfördelning med medelvärde mu och populationsvarians sigma
mu <- 1/2
sigma2 <- mu^2
x_pop <- rexp(N, 1/mu)
mu <- mean(x_pop)
sigma2 <- var(x_pop)
hist(x, breaks = 40)


# Ta fram samplingfördelning.
n <- 100
B <- 10000
xbar <- rep(NA)
for(i in 1:B){
  x_sample <- sample(x_pop, n, replace = FALSE)
  xbar[i] <- mean( x_sample )
  print(i)
}

hist(xbar, freq = FALSE, breaks=40)
mu
mean(xbar)
var(xbar)
vxbar <- ( (N-n)/(N-1) )*sigma2/n
vxbar
curve( dnorm(x, mu, sqrt(vxbar)), min(xbar), max(xbar), add=TRUE, col="red" )




