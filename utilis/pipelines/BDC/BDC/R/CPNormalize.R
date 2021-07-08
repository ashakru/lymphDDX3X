CPNormalize <-
function(test.merge, method="Zscore", trainSet){
if(trainSet=="Dave"){
	trainSet=DaveData
}
else { trainSet = HummelData}
	cat("Normalizing...\n")
	geneUpdate=geneCheck( trainSet$GeneID)
	train.merge = avereps(trainSet$Exprs, ID=geneUpdate)
	if( method=="Zscore" | method=="zscore"){
		#cat("Apply Zscore cross-platform normalization\n") 
		trainNormal = zscoreTransfer(train.merge)
		testNormal = zscoreTransfer(test.merge)}
	else if(method=="Rank" | method=="rank"){ 
		#cat("Apply Rank cross-platform normalization\n")
		trainNormal = rankTransfer(train.merge)
		testNormal = rankTransfer(test.merge)}
	else if(method=="DWD" | method=="dwd") {
		#cat("Apply DWD cross-platform normalization\n") 
		nordwd = dwd(train.merge, test.merge) 
		trainNormal = nordwd$x
		testNormal = nordwd$y}
	else if(method=="XPN" | method=="xpn"){
		#cat("Apply XPN cross-platform normalization\n")
		norxpn = xpn(train.merge, test.merge)       
		trainNormal = norxpn$x
		testNormal = norxpn$y}

list(train.normal=trainNormal, test.normal=testNormal)
}
