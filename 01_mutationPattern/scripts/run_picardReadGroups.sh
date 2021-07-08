#!/bin/sh

# Script for Picard AddOrReplaceReadGroups

# # Parameters
GOYAHOME="~/Documents/GOYAdata"
SO="coordinate"
RGID=1
RGLB="GOYAlib"
RGPL="illumina"
RGPU="unit1"
# #

ls $GOYAHOME/bam/*.bam | cut -d '/' -f 10 | cut -d '.' -f 1 | parallel -j 10 picard AddOrReplaceReadGroups \
I=$GOYAHOME/bam/'{}'.bam O=$GOYAHOME/bam_sorted/'{}'_sorted.bam \
SO=$SO RGID=$RGID RGLB=$RGLB RGPL=$RGPL RGPU=$RGPU RGSM='{}'
