Drug <- as.factor( c(rep("A",4),rep("T",4),rep("P",4)) ) 
Drug
x <- c(3,5,3,5,2,2,4,4,2,1,3,2)
DF <-data.frame(x,Drug)
aov(x~Drug,data=DF)
summary(aov(x~Drug,data=DF))
history(10)
