zscoreTransfer <-
function(exprTest){
zscoreTest = exprTest
means <- rowMeans(exprTest)
sds <- apply(exprTest, 1, sd)
zscoreTest <- (exprTest - means) / sds
zscoreTest
}
