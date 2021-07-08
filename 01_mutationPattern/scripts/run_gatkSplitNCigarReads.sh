#!/bin/sh

# # Parameters
GOYAHOME="/shares/MRC-CU/Samarajiwa/Users/JAK75/pipelines/GOYAdata"
REFGENOME="/home/JAK75/Documents/reference-genome/hg38_NCBI/hg38.fa"
# #

ls $GOYAHOME/bam_sorted/*reordered.bam | cut -d '/' -f 10 | cut -d '.' -f 1 | parallel -j 5 --tmpdir /home/JAK75/tmp GenomeAnalysisTK \
-T SplitNCigarReads -R $REFGENOME -I $GOYAHOME/bam_sorted/'{}'.bam -o $GOYAHOME/bam_sorted/'{}'_split.bam \
-rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS
