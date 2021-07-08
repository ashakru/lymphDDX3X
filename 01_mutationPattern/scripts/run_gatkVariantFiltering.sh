#!/bin/sh 

# Script that computes RNA-Seq reads coverage for DDX3X region  
VCFOLDER="mutationsCalling/vcf_raw"
REFGENOME="~/Documents/reference-genome/hg38_NCBI/hg38.fa"
echo $VCFOLDER

ls $VCFOLDER/*split.vcf | cut -d '/' -f 3 | cut -d '.' -f 1  | parallel -j 3 "GenomeAnalysisTK \
-T VariantFiltration -R $REFGENOME -V ${VCFOLDER}/{}.vcf -window 35 -cluster 3 -filterName FS -filter 'FS > 30.0' \
-filterName QD -filter 'QD < 2.0' -o mutationsCalling/vcf_filtered/{}_filtered.vcf"