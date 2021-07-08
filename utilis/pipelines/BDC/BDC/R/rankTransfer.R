rankTransfer <-
function(exprTest){
rankTest = exprTest
for(i in 1: nrow(rankTest)){ rankTest[i,] = rank(exprTest[i,]) / ncol(exprTest) - 0.5 }
rankTest
}
