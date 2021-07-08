setTrainTh <-
function(trainingSetTh){
cat("trainingset...\n")
	if(trainingSetTh=="Dave"){
		sub = c(1:303)}
	else if(trainingSetTh=="0.5" | trainingSetTh=="strict"){
                #cat("Traing set threshold equals 0.5\n")
                sub = c(1:221) }
        else if(trainingSetTh=="0.8"){
                #cat("Traing set threshold equals 0.8\n")
                sub= c(1:221)[HummelData$BLprob >0.8 | HummelData$BLprob <0.2] }
        else if(trainingSetTh=="0.9"){
                #cat("Traing set threshold equals 0.9\n")
                sub = c(1:221)[ HummelData$BLprob >0.9 |  HummelData$BLprob <0.1] }
        else {
                #cat("Traing set threshold equals 0.95\n")
                sub = c(1:221)[ HummelData$BLprob >0.95 |  HummelData$BLprob <0.05]  }
sub
}
