A  <- c(10.08,10.11,10.09,10.10,10.12)
B  <- c( 9.88,10.14,10.02, 9.80,10.21)
C  <- c(10.19, 9.79, 9.69,10.05, 9.78)
D  <- c(10.04, 9.98,10.02, 9.97,10.04)


##########################################
# One Sample Test 

t.test(A, mu=10)


##########################################
# Two Independent Sample Test
 
t.test(A,B)

##########################################
# Test for Equality of Variances

var.test(A,B)

##########################################
# Testing Normality

# combine data sets into one (arbitrary decision to do this)

X=c(A,B,C,D)

qqnorm(X)
qqline(X)

shapiro.test(X)
 
