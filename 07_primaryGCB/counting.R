bams <- list.files("bam", "*.bam$", full.names = T)
GTF <- "~/Documents/reference-genome/gencode_v29_annotations/gencode.v29.annotation.gtf"

counts <- Rsubread::featureCounts(files = bams,
                                  annot.ext = GTF,
                                  isGTFAnnotationFile = T,
                                  isPairedEnd = F,
                                  countMultiMapping=F,
                                  strandSpecific = 0,
                                  nthreads = 16,
                                  allowMultiOverlap = T,
                                  minOverlap = 25,
                                  GTF.featureType = "exon",
                                  GTF.attrType = "gene_id")


save(counts, file = "RNA_counts.RData")
