#!/bin/sh 

# # Parameters
GOYAHOME="~/Documents/GOYAdata"
REFGENOME="~/Documents/reference-genome/hg38_NCBI/hg38.fa"
# #

ls $GOYAHOME/bam_sorted/*split.bam | cut -d '/' -f 10 | cut -d '.' -f 1 | parallel -j 10 GenomeAnalysisTK \
-T HaplotypeCaller -R $REFGENOME -I $GOYAHOME/bam_sorted/'{}'.bam -o $GOYAHOME/haplotypesCall/'{}'.vcf \
-dontUseSoftClippedBases -stand_call_conf 20.0 
