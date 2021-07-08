#!/bin/sh

# Script for Picard MarkDuplicates

# # Parameters
GOYAHOME="~/Documents/GOYAdata"
# #

ls $GOYAHOME/bam/*.bam | cut -d '/' -f 10 | cut -d '.' -f 1 | parallel -j 10 picard MarkDuplicates \
I=$GOYAHOME/bam_sorted/'{}'_sorted.bam O=$GOYAHOME/bam_sorted/'{}'_dedup.bam \
CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT M={}_dedup.txt
