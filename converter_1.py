#! usr/bin/env python

# this program uses biopython to convert gbk and fastq to fasta formats

#from Bio.Seq import Seq
#from Bio.Alphabet import IUPAC
from Bio import SeqIO

#SeqIO.convert("USA300.gbk","genbank","USA300_converted.fa","fasta")

SeqIO.convert("VA13_N112_R1.fastq","fastq","VA13_N112_R1_con.fasta","fasta")

SeqIO.convert("VA13_N112_R2.fastq","fastq","VA13_N112_R2_con.fasta","fasta")
