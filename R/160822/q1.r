 num_samples <- 50000
 data <- rexp(num_samples, 0.2)
 x <- data.frame(X = seq(1, num_samples , 1), Y = sort(data))
 plot(x)
 x1 <- split(data,as.integer((seq_along(data) - 1) / 100))
 pdata <- rep(0, 100);
 for(i in 1:100){
     val=round(x1[[1]][i], 0);
     if(val <= 100){
        pdata[val+1] = pdata[val+1] + 1/ 100;
     }
 }
  xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 
 cdata[1] <- pdata[1]
 
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");

print("The mean is-")
print(mean(x1[[1]]))
print("The S.D. is")
print(sd(x1[[1]]))

 pdata <- rep(0, 100);
 for(i in 1:100){
     val=round(x1[[2]][i], 0);
     if(val <= 100){
        pdata[val+1] = pdata[val+1] + 1/ 100;
     }
 }
  xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 
 cdata[1] <- pdata[1]
 
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");

print("The mean is-")
print(mean(x1[[2]]))
print("The S.D. is")
print(sd(x1[[2]]))

 pdata <- rep(0, 100);
 for(i in 1:100){
     val=round(x1[[3]][i], 0);
     if(val <= 100){
        pdata[val+1] = pdata[val+1] + 1/ 100;
     }
 }
  xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 
 cdata[1] <- pdata[1]
 
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");

print("The mean is-")
print(mean(x1[[3]]))
print("The S.D. is")
print(sd(x1[[3]]))

 pdata <- rep(0, 100);
 for(i in 1:100){
     val=round(x1[[4]][i], 0);
     if(val <= 100){
        pdata[val+1] = pdata[val+1] + 1/ 100;
     }
 }
  xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 
 cdata[1] <- pdata[1]
 
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");

print("The mean is-")
print(mean(x1[[4]]))
print("The S.D. is")
print(sd(x1[[4]]))

 pdata <- rep(0, 100);
 for(i in 1:100){
     val=round(x1[[5]][i], 0);
     if(val <= 100){
        pdata[val+1] = pdata[val+1] + 1/ 100;
     }
 }
  xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 
 cdata[1] <- pdata[1]
 
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");

print("The mean is-")
print(mean(x1[[5]]))
print("The S.D. is")
print(sd(x1[[5]]))

meandata <- rep(1, 500);
sdata <-rep(1,500);
for(i in 1:500){
meandata[i]=mean(x1[[i]])
sdata[i]=mean(x1[[i]])
}
 tab <- table(round(meandata,1))
 
 plot(tab, "h", xlab="Value", ylab="Frequency")
 
 pdata <- rep(0, 100);
 
 for(i in 1:500){
     val=round(meandata[i], 0);
     if(val <= 100){
        pdata[val] = pdata[val] + 1/ 500;
     }
 }
 
 xcols <- c(0:99)
 plot(xcols, pdata, "l", xlab="X", ylab="f(X)")
 cdata <- rep(0, 100)
 cdata[1] <- pdata[1]
 for(i in 2:100){
     cdata[i] = cdata[i-1] + pdata[i]
 }
 plot(xcols, cdata, "o", col="blue", xlab="X", ylab="F(X)");
print("The mean of means is-")
print(mean(meandata))
print("The s.d of means is-")
print(sd(meandata))
print("The mean of original distribution is-")
print("5")
