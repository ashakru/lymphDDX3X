print.gepclass <-
function(x, ...){
	cat("\nNormalization Method:", x$norm.method,"\n")
	cat("\nClassifier Gene Number:", length(x$classifierGene), "\n")
	cat("\nTraining set GSE4475 threshold:", x$trainSetTh, "\n")
	cat("\nprediction:\nBL",sum(x$prediction$class=="BL"), "\nDLBCL", sum(x$prediction$class=="DLBCL"), "\n")
        cat("\nBL probability interval:\n")
        cat("[0-0.2]:", sum(x$prediction$BLprobability>0 & x$prediction$BLprobability<=0.2), "\n")
        cat("[0.2-0.5]:", sum(x$prediction$BLprobability>0.2 & x$prediction$BLprobability<=0.5), "\n")
        cat("[0.5-0.8]:", sum(x$prediction$BLprobability>0.5 & x$prediction$BLprobability<=0.8), "\n")
        cat("[0.8-1]:", sum(x$prediction$BLprobability>0.8 & x$prediction$BLprobability<=1), "\n")
}
