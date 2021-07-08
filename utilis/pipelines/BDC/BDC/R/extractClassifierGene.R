extractClassifierGene <-
function(classifierGene, normalize.data){
	cat("extracting gene...\n")
	if (classifierGene=="10genes"){
       		# cat("Apply 10 classifier gene\n")
                classifierGene=geneCheck(Gene$Gene10)}
	else if (classifierGene=="21genes"){
		#cat("Apply 21 classifier gene\n")
                classifierGene=geneCheck(Gene$Gene21)}
	else if (classifierGene=="60genes"){
        	#cat("Apply 60 classifier gene\n")
                classifierGene=geneCheck(Gene$Gene60)}
        else	{#cat("Apply 28 classifier gene\n")
                classifierGene=geneCheck(Gene$Gene28)}
pos = match(classifierGene, rownames(normalize.data$test.normal))
if(sum(is.na(pos))){
        cat("Can't locate", sum(is.na(pos)), "gene:", classifierGene[is.na(pos)], "in testset\n")}

pos1=pos[!is.na(pos)]
test.expr = normalize.data$test.normal[pos1,]
train.expr = normalize.data$train.normal[match(classifierGene[!is.na(pos)], rownames(normalize.data$train.normal)),]

list(train.expr=train.expr, test.expr=test.expr)
}
