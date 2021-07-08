#!/bin/sh 

#Reorder bam files to match reference fasta contigs

# # Parameters
GOYAHOME="~/Documents/GOYAdata"
REFGENOME="~/Documents/reference-genome/hg38_NCBI/hg38.fa"
#picard CreateSequenceDictionary R=~Documents/reference-genome/hg38_NCBI/hg38.fa O=~/Documents/reference-genome/hg38_NCBI/hg38.dict

# #

ls $GOYAHOME/bam_sorted/*_dedup.bam | cut -d '/' -f 10 | cut -d '.' -f 1 | parallel -j 20 picard ReorderSam \
I=$GOYAHOME/bam_sorted/'{}'.bam \
O=$GOYAHOME/bam_sorted/'{}'_reordered.bam \
R=$REFGENOME