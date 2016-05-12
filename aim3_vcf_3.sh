#! /usr/bin/env bash

# This program takes filters the aligned vcf file and intersects it with
# the reference sequence.

cat VCF/VA13nares_B0_algin.vcf| \
    SnpSift filter \
    "((QUAL > 40 & DP > 40) & isVariant(GEN[0]) & isVariant(GEN[1]) \
    & isVariant(GEN[2]) & isVariant(GEN[3]) & isRef(GEN[4]))" > filter_refB0.vcf

bedtools intersect -header -wo -a filter_refB0.vcf -b usa300.gff > intUSA300_filterB0.vcf
