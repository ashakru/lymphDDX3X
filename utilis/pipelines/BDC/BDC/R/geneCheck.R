geneCheck <-
function( geneName){
	check.GeneUpdate = checkGeneSymbols(geneName, unmapped.as.na=F)
	check.Gene = check.GeneUpdate$Suggested.Symbol
check.Gene
}
