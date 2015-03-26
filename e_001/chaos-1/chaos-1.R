#### Monte-Carlo simulation: violating the assumptions
#### of Chaos Theory and the resulting distributions
#### of Correlation Dimension estimates
#### Code written by Andreï V. Kostyrka and may be
#### freely re-used for any purpose

require(fractal)
require(rgl)

### Topic 1: Number of points
nobs <- 16000
testdim <- 8
nrep <- 500
# Rough time estimates:
# nobs = 200, nrep = 1000: 53 s
# nobs = 200, nrep = 10000: 521 s Linux / 572 Windows
# nobs = 400, nrep = 1000: 75 s
# nobs = 600, nrep = 10000: 990 s Win
# nobs = 1800, nrep = 10000: 5090 s Win
# nobs = 5400, nrep = 100: 570 s Linux
# nobs = 16000, nrep = 500: 25600 s Linux
MC <- array(0,dim=c(nrep, testdim))

# Rucklidge oscillator
ptm <- proc.time()
a=2; b=6.7; dt=0.1

for (j in 1:nrep) {
# Bad starting point: X=0+runif(1)/10; Y=0+runif(1)/10; Z=0+runif(1)/10
X <- 0+runif(1)/5; Y <- 0+runif(1)/5; Z <- 4+runif(1)/5
XYZ <- array(0, dim=c(nobs,3))
for(i in 1:nobs){
  X1 <- X; Y1 <- Y; Z1 <- Z
  X <- X1+(-a*X1+b*Y1 - Y1*Z1)*dt
  Y <- Y1+(X1)*dt
  Z <- Z1+(-Z1 + Y1^2)*dt
  XYZ[i,]=c(X,Y,Z)
}
x=XYZ[,1]
y=XYZ[,2]
z=XYZ[,3]

cdest <- corrDim(x, dimension=testdim)

for(k in 1:testdim){
MC[j, k] <- attributes(cdest)$fit[[k]]$coefficients[[2]]
}
}
ptm2 <- proc.time()
print(paste0("Time taken to conduct ", nrep, " runs with ", nobs, " points: ", round((ptm2-ptm)[3],2)))

# xlim = range(MC)
pdf(file="nobs5400.pdf", height=4.2, width=6)
plot(density(MC[,2], 0.03), xlim = c(1.2, 3.2), ylim=c(0, 3), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 5400 points", sub=NULL)
for(i in 3:testdim){
  lines(density(MC[,i], bw = 0.03), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topleft", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()

plot(x, z, cex=0.5, xlim=c(-2,2), ylim=c(3,7))
plot3d(XYZ, type="l", cex=0.7)


# Write the Monte-Carlo CD estimates (cols = embedding dimension) 
# write.csv(MC, "Ruck00200.csv")
# write.csv(MC, "Ruck00600.csv")
# write.csv(MC, "Ruck01800.csv")
# write.csv(MC, "Ruck05400.csv")
# write.csv(MC, "Ruck16000.csv")

Ruck00200 <- read.csv("Ruck00200.csv")
Ruck00200 <- Ruck00200[,2:ncol(Ruck00200)]
Ruck00600 <- read.csv("Ruck00600.csv")
Ruck00600 <- Ruck00600[,2:ncol(Ruck00600)]
Ruck01800 <- read.csv("Ruck01800.csv")
Ruck01800 <- Ruck01800[,2:ncol(Ruck01800)]
Ruck05400 <- read.csv("Ruck05400.csv")
Ruck05400 <- Ruck05400[,2:ncol(Ruck05400)]
Ruck16000 <- read.csv("Ruck16000.csv")
Ruck16000 <- Ruck16000[,2:ncol(Ruck16000)]

pdf(file="nobs00200.pdf", height=4.2, width=6)
plot(density(Ruck00200[,2], 0.04), xlim = c(1.0, 3.2), ylim=c(0, 2.2), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 200 points", sub=NULL)
for(i in 3:testdim){
  lines(density(Ruck00200[,i], bw = 0.04), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topright", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()

pdf(file="nobs00600.pdf", height=4.2, width=6)
plot(density(Ruck00600[,2], 0.035), xlim = c(1.3, 3.2), ylim=c(0, 2.7), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 600 points", sub=NULL)
for(i in 3:testdim){
  lines(density(Ruck00600[,i], bw = 0.04), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topright", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()

pdf(file="nobs01800.pdf", height=4.2, width=6)
plot(density(Ruck01800[,2], 0.025), xlim = c(1.6, 3.2), ylim=c(0, 2.7), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 1800 points", sub=NULL)
for(i in 3:testdim){
  lines(density(Ruck01800[,i], bw = 0.02), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topright", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()

pdf(file="nobs05400.pdf", height=4.2, width=6)
plot(density(Ruck05400[,2], 0.02), xlim = c(1.7, 3.2), ylim=c(0, 4.5), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 5400 points", sub=NULL)
for(i in 3:testdim){
  lines(density(Ruck05400[,i], bw = 0.04), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topright", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()

pdf(file="nobs16000.pdf", height=4.2, width=6)
plot(density(Ruck16000[,2], 0.015), xlim = c(1.7, 3.2), ylim=c(0, 6), col="#FF0000", lwd=2, main = "Density of Rucklidge Corr. Dim. estimates from 16000 points", sub=NULL)
for(i in 3:testdim){
  lines(density(Ruck16000[,i], bw = 0.04), col=colorRampPalette(c("#FF0000", "#00AA00", "#0000AA"))(testdim-1)[i-1], lwd=2)
  abline(v = 2, lty=2)
  legend("topright", c("2", "3", "4", "5", "6", "7", "8"), lwd=2, col=colorRampPalette(c("red", "#00AA00", "#0000AA"))(testdim-1), title="Emb. Dim.")
}
dev.off()


plot(x[1:1000], type="l", xlab="Time (dt=0.1)", ylab="x", main="Rucklidge oscillator, first coordinate")
plot(y, x)
#
# plot(x[2:nobs], x[1:(nobs-1)])
# plot(x[3:nobs], x[1:(nobs-2)])

### Topic 2:  Presence of noise
nobs <- 2000
testdim <- 5
nrep <- 500
MC <- array(0,dim=c(nrep, testdim))

for (j in 1:nrep){

x <- c(rep(0, nobs))
y <- c(rep(0, nobs))
t <- seq(1, nobs)
x[1] <- runif(1)/50 
y[1] <- runif(1)/50 + 0.213
for (i in 2:nobs) {
  x[i] = 1 - 1.4*x[i-1]^2 + y[i-1]
  y[i] = 0.299 * x[i-1]
}
x <- x + rnorm(nobs, 0, 0.071)
cdest <- corrDim(x, dimension=testdim)

for(k in 1:testdim){
  MC[j, k] <- attributes(cdest)$fit[[k]]$coefficients[[2]]
}
}


plot(density(MC[,2], bw=0.01, kernel="epanechnikov"), xlim = c(1.2, 5), ylim=c(0, 16), col="#FF0000", lwd=2, main = "H?non Corr. Dim. estimates (T = 4,000), 10% noise", sub=NULL)
for(i in 3:testdim){
  lines(density(MC[,i], bw = 0.01*(i-1)^(0.7), kernel="epanechnikov"), col=colorRampPalette(c("red", "#00AA00"))(testdim-1)[i-1], lwd=2)
}

plot(x[1:nobs-1], x[2:nobs], xlab="x(t-1)", ylab="x(t)", main="H?non map (10% noise)")

# write.csv(x, "HenX.csv")
# write.csv(MC, "Hen0n.csv")
# write.csv(MC, "Hen05pn.csv")
# write.csv(MC, "Hen20pn.csv")


### 3: Periodicity

nobs <- 4000
# nobs <- 20000
testdim <- 5
nrep <- 500
dt <- 0.01
MC <- array(0,dim=c(nrep, testdim))
  
  # Lorenz attractor
  
sigma=10; beta=8/3; rho=28
  

# for (j in 1:nrep){
#     X=runif(1)*5-3; Y=runif(1)*5-8; Z=runif(1)*5+25
#     XYZ=array(0,dim=c(nobs,3))
#     t=0
#     for(i in 1:nobs){
#       X1=X; Y1=Y; Z1=Z
#       X=X1+sigma*(Y1 - X1)*dt
#       Y=Y1+X1*(rho - Z1)*dt
#       Z=Z1+(X*Y - beta*Z1)*dt
#       #t=t+dt
#       XYZ[i,]=c(X,Y,Z)
#     }
#     x=XYZ[,1]
#     y=XYZ[,2]
#     z=XYZ[,3]
#     
#     cdest <- corrDim(x, dimension=testdim)
#     
#     for(k in 1:testdim){
#       MC[j, k] <- attributes(cdest)$fit[[k]]$coefficients[[2]]
#     }
#   }

for (j in 1:nrep){
  X=runif(1)*5-3; Y=runif(1)*5-8; Z=runif(1)*5+25
  XYZ=array(0,dim=c(nobs,3))
  t=0
  for(i in 1:nobs){
    X1=X; Y1=Y; Z1=Z
    X=X1+sigma*(Y1 - X1)*dt
    Y=Y1+X1*(rho - Z1)*dt
    Z=Z1+(X*Y - beta*Z1)*dt
    #t=t+dt
    XYZ[i,]=c(X,Y,Z)
  }
  x=XYZ[,1]
  y=XYZ[,2]
  z=XYZ[,3]
  
#   x <- x[seq(1, length(x), 5)]
#   y <- y[seq(1, length(y), 5)]
#   z <- z[seq(1, length(z), 5)]
  cdest <- corrDim(x, dimension=testdim)
  
  for(k in 1:testdim){
    MC[j, k] <- attributes(cdest)$fit[[k]]$coefficients[[2]]
  }
}

# For broken cycles
#write.csv(MC[1:j-1,], paste0(substr(date(), 12, 13),substr(date(), 15, 16), substr(date(), 18, 19), ".csv"))

plot3d(x, y, z, col="red", size=3) 
plot3d(x[1:3998], x[2:3999], x[3:4000], col="red", size=3) 
  
  # xlim = range(MC)
plot(density(MC[,2], bw=0.03, kernel="epanechnikov"), xlim = c(1.6,3.2), ylim=c(0,8), col="#FF0000", lwd=2, main = "Density of Lorenz Corr. Dim. estimates with dt=1.0", sub=NULL)
  for(i in 3:testdim){
    lines(density(MC[,i], bw = 0.03, kernel="epanechnikov"), col=colorRampPalette(c("red", "#00AA00"))(testdim-1)[i-1], lwd=2)
  }

write.csv(MC, "Lorenz1000.csv")

### 4: Zeros

mylag <- 50
nobs <- 4096*mylag
testdim <- 5
nrep <- 10
dt <- 0.001
MC <- array(0,dim=c(nrep, testdim))

# Rabinovich---Fabrikant attractor

a=1.1; b=0.87


for (j in 1:nrep) {
     X=-0.9829+runif(1)/1000; Y=0.9952; Z=0.5609  
  #  X=-1; Y=0; Z=0.5
    XYZ=array(0, dim=c(nobs,3))
    t=0
    for(i in 1:nobs){
      X1=X; Y1=Y; Z1=Z
      X=X1 + (Y1*(Z1 - 1 + X1^2)+b*X1)*dt
      Y=Y1 + (X1*(3*Z1 + 1 - X1^2)+b*Y1)*dt
      Z=Z1 + (-2*Z1*(a + X1*Y1))*dt
      #t=t+dt
      XYZ[i,]=c(X,Y,Z)
    }
    x=XYZ[,1]
    y=XYZ[,2]
    z=XYZ[,3]
    
    x <- x[seq(1, length(x), mylag)]
    y <- y[seq(1, length(y), mylag)]
    z <- z[seq(1, length(z), mylag)]
    x <- -1*rbinom(4096, 1, 0.5)*x

    cdest <- corrDim(x, dimension=testdim)
    
    for(k in 1:testdim){
      MC[j, k] <- attributes(cdest)$fit[[k]]$coefficients[[2]]
    }
  }


plot3d(x, y, z, col="red", size=3) 
plot3d(x[1:3995], x[3:3997], x[5:3999], col="red", size=3) 

# xlim = range(MC)
plot(density(MC[,2], bw=0.02, kernel="epanechnikov"), xlim = c(0.9,1.6), ylim=c(0,13), col="#FF0000", lwd=2, main = "Density of Rabinovich-Fabrikant Corr. Dim. with 50% zeros", sub=NULL)
for(i in 3:testdim){
  lines(density(MC[,i], bw = 0.02, kernel="epanechnikov"), col=colorRampPalette(c("red", "#00AA00"))(testdim-1)[i-1], lwd=2)
}

# write.csv(MC, "Rabin00.csv")
# write.csv(MC, "Rabin05.csv")
# write.csv(MC, "Rabin15.csv")
# write.csv(MC, "Rabin50.csv")
# MC <- read.csv("Rabin05.csv", row.names=1)




### Visualisation

# Rucklidge oscillator
a=2; b=6.7; dt=0.1
nobs <- 16000
X=runif(1)/50; Y=runif(1)/50; Z=runif(1)/50
XYZ=array(0,dim=c(nobs,3))
t=0
  for(i in 1:nobs){
    X1=X; Y1=Y; Z1=Z
    X=X1+(-a*X1+b*Y1 - Y1*Z1)*dt
    Y=Y1+(X1)*dt
    Z=Z1+(-Z1 + Y1^2)*dt
    #t=t+dt
    XYZ[i,]=c(X,Y,Z)
  }
  x=XYZ[,1]
  y=XYZ[,2]
  z=XYZ[,3]
rucklidge <- XYZ

# Henon map
nobs <- 1000
x <- c(rep(0, nobs))
y <- c(rep(0, nobs))
t <- seq(1, nobs)
x[1] <- runif(1)/50 
y[1] <- runif(1)/50 + 0.213
for (i in 2:nobs) {
  x[i] = 1 - 1.4*x[i-1]^2 + y[i-1]
  y[i] = 0.299 * x[i-1]
}
henon = cbind(x, y)
xx <- x[1:3998]
xy <- x[2:3999]
xz <- as.vector(array(0, dim=c(3998,1)))
H3D <- cbind(xx, xy, xz)
theta = 0.45
ro <- matrix(c(cos(theta), 0, sin(theta), 0, 1, 0, -sin(theta),0, cos(theta)), nrow=3, byrow = F)
H3DR <- t(ro %*% t(H3D))

# Lorenz attractor
nobs2 <- 100000
dt <- 0.001
sigma=10; beta=8/3; rho=28
  X=runif(1)*5-3; Y=runif(1)*5-8; Z=runif(1)*5+25
  XYZ=array(0,dim=c(nobs2,3))
  t=0
  for(i in 1:nobs2){
    X1=X; Y1=Y; Z1=Z
    X=X1+sigma*(Y1 - X1)*dt
    Y=Y1+X1*(rho - Z1)*dt
    Z=Z1+(X*Y - beta*Z1)*dt
    #t=t+dt
    XYZ[i,]=c(X,Y,Z)
  }
  x=XYZ[,1]
  y=XYZ[,2]
  z=XYZ[,3]
x <- x[seq(1, length(x), 10)]
y <- y[seq(1, length(y), 10)]
z <- z[seq(1, length(z), 10)]
lorenz <- cbind(x,y,z)

# Rabinovich---Fabrikant
a=1.1; b=0.87; nobs2 <- 100000; dt <- 0.001
  X=-0.9829+runif(1)/1000; Y=0.9952; Z=0.5609  
  XYZ=array(0, dim=c(nobs2,3))
  t=0
  for(i in 1:nobs2){
    X1=X; Y1=Y; Z1=Z
    X=X1 + (Y1*(Z1 - 1 + X1^2)+b*X1)*dt
    Y=Y1 + (X1*(3*Z1 + 1 - X1^2)+b*Y1)*dt
    Z=Z1 + (-2*Z1*(a + X1*Y1))*dt
    XYZ[i,]=c(X,Y,Z)
  }
  x=XYZ[,1]
  y=XYZ[,2]
  z=XYZ[,3]
  x <- x[seq(1, length(x), 20)]
  y <- y[seq(1, length(y), 20)]
  z <- z[seq(1, length(z), 20)]
rabinovich <- cbind(x,y,z)

wn <- rnorm(4000, 0, 1)

plot(density(wn))
points(cbind(wn[1:300], as.vector(array(0, dim=c(300, 1)))))
plot(wn[1:(length(wn)-1)], wn[2:(length(wn))], col="red")
plot3d(wn[1:(length(wn)-2)], wn[2:(length(wn)-1)], wn[3:length(wn)], size="3", col="red", xlab="x", ylab="y", zlab="z")

plot3d(rucklidge, size="3", col="red")
plot3d(rucklidge[1:3994,1], rucklidge[4:3997,1], rucklidge[7:4000,1], size="3", col="red")

plot(henon[1:3999,1], henon[2:4000,1], col="red", xlab="x", ylab="y")
plot3d(H3DR[,1], H3DR[,2], H3DR[,3], col="red", size="3", xlab="x", ylab="y", zlab="z")

plot3d(lorenz, col="red", size=3) 

plot3d(rabinovich, col="red", size=3) 
plot3d(x[1:(length(x)-4)], x[3:(length(x)-2)], x[5:(length(x))], col="red", size="3", xlab="x", ylab="y", zlab="z")


setwd("~/Dropbox/repos/epsilon/e_001/chaos-1")
open3d(windowRect = c(100,100,600,600), zoom=0.8)
plot3d(rabinovich, theta=0, phi=25, col = "red", xlab="", ylab="", zlab="", axes=FALSE)
movie3d(spin3d(axis = c(0,0,1), rpm = 20), duration=3, movie="rabin",  type = "png", dir=getwd())

open3d(windowRect = c(100,100,600,600), zoom=0.8)
plot3d(lorenz, theta=0, phi=25, col = "red", xlab="", ylab="", zlab="", axes=FALSE)
movie3d(spin3d(axis = c(0,0,1), rpm = 20), duration=3, movie="lor",  type = "png", dir=getwd())

open3d(windowRect = c(100,100,600,600), zoom=0.8)
plot3d(rucklidge, theta=0, phi=25, col = "red", xlab="", ylab="", zlab="", axes=FALSE, size=2)
movie3d(spin3d(axis = c(0,0,1), rpm = 20), duration=3, movie="ruck",  type = "png", dir=getwd())

