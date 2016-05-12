#! /usr/bin/env bash

#build a file from the reference that bowtie2 can use
#file out is USA300_bowtie
bowtie2-build USA300_FPR3757.fa USA300_bowtie

# make an indexed reference file
samtools faidx USA300_FPR3757.fa

# use bowtie2 to align the genomic fastq files and set up read groups (rg)
# to identify files in the freebayes step, repeat for each isolate
bowtie2 -t --rg-id B0 --rg SM:B0 --rg LB:B0 --rg PL:ILLUMINA --rg PI:400 \
    -x USA300_bowtie -1 fastq/VA13_B0_R1.fastq.gz -2 fastq/VA13_B0_R2.fastq.gz \
    -S bowtie_align/VA13_B0_USA300_align.SAM 2>alignB0.log

samtools sort bowtie_align/VA13_B0_USA300_align.SAM -o bowtie_align/VA13_B0_USA300_alignsort.BAM

samtools index bowtie_align/VA13_B0_USA300_alignsort.BAM
#make an indexed BAM of the aligned file

# use freebayes for snp calling and used a list (-L) that has all of the
# bowtie aligned genome files
freebayes -f USA300_FPR3757.fa -L bowtie_align/VA13_alignfiles.txt -v VCF/VA13nares_B0_algin.vcf
