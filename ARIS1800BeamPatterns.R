# Measured 2-way beam pattern on V-plane (for DIDSON-STD or ARIS1800)

x <- c(-5.5, -5.0, -4.5, -4.0, -3.5,-3.0, -2.5, -2.0, -1.5, -1.0, -0.5,  0.0,  
0.5,  1.0,  1.5, 2.0,  2.5,  3.0,  3.5,  4.0,  4.5,  5.0,  5.5,  6.0,  6.5,  7.0,  7.5,  8.0)
y <- c(64.50, 66.50, 68.50, 68.00, 68.00, 69.00, 72.00, 74.00, 73.50, 71.50, 74.00, 75.50,
76.00, 74.00, 75.00, 75.25, 75.00, 72.50, 72.00, 73.50, 73.50, 72.00, 71.00, 71.25,
71.25, 70.00, 68.30, 68.50)
while(dev.cur()!=1) dev.off()

win.graph()
plot(x, y, main="2-way beam pattern on V-plane", xlab="V.Beta (deg)", ylab="Echo Intensity (dB)")
lines(x,y)

# Measured 2-way beam pattern on H-plane (for DIDSON-STD or ARIS1800)
x <- c(-13.0, -11.0,  -9.0,  -6.8,  -4.2,  -1.4,   1.2,   4.0,   6.5,   9.0,  11.0,  13.0)
y <- c(54.5, 60.0, 64.8, 68.5, 71.0, 71.5, 70.0, 69.5, 67.0, 66.0, 59.0, 52.0)
win.graph()
plot(x, y, main="2-way beam pattern on H-plane", xlab="H.Theta (deg)", ylab="Echo Intensity (dB)")
lines(x,y)

# 1.1. Read in the Beam Pattern File  
BP   = read.csv("BeamPatterns.csv", as.is=T,header=T)

V.Beta = BP$V.Beta
H.Beta = seq(-20, 20, 0.5)

BP <- BP[, -1]
BBP <- as.matrix(BP)
BBP <-t(BBP)

win.graph()
persp(H.Beta,V.Beta, BBP, theta = 45, phi = 30, xlab="Off-axis Angle on H-plane", ylab="Off-axis Angle on V-plane", zlab="DIDSON 2-Way BeamPattern")

win.graph()
par(mfrow=c(2,1))
contour(H.Beta,V.Beta, BBP,  xlim = range(H.Beta, finite = TRUE), ylim=range(V.Beta, finite = TRUE), zlim=range(BBP, finite = TRUE),
nlevels = 12, xlab="Off-axis Angle on H-plane", ylab="Off-axis Angle on V-plane", main="DIDSON 2-Way BeamPattern")

contour(H.Beta,V.Beta, BBP-max(BBP),  xlim = range(H.Beta, finite = TRUE), ylim=range(V.Beta, finite = TRUE),zlim=range(BBP-max(BBP), finite = TRUE), 
nlevels = 12, xlab="Off-axis Angle on H-plane", ylab="Off-axis Angle on V-plane", main="DIDSON 2-Way BeamPattern")

win.graph()
par(mfrow=c(2,1))
image(H.Beta, V.Beta,BBP, xlab="H.Theta(deg)", ylab="V.Beta (deg)", main="2-Way DIDSON BeamPattern")
image(H.Beta, V.Beta,BBP, xlab="H.Theta(deg)", ylab="V.Beta (deg)", xlim=c(-15, 15), ylim=c(-8, 12))


