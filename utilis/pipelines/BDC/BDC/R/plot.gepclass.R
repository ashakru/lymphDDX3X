plot.gepclass <-
function(x, ...){
	y=x$classifier.data$test
	par(mfrow=c(2,1))
	boxplot(y[y$Class=="DLBCL", 1: ncol(y)-1],varwidth=T, las=2, main="classifier gene in DLBCL class")
	boxplot(y[y$Class=="BL", 1: ncol(y)-1], varwidth=T, las=2, main="classifier gene in BL class")	
}
