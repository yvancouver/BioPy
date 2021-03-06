#!/usr/bin/python

# pass file containing fasta entry 
# and the script returns seq name, length and gene name 
# based on the cardio_dict

import cardio_dict
from Bio import SeqIO
import sys
fasta_file = sys.argv[1]
tot_nuc = 0
tot_gene = 0
for seq_record in SeqIO.parse(fasta_file, "fasta"):
    print seq_record.id,"\t", len(seq_record),"\t",cardio_dict.Cardio_dict[seq_record.id[:-2]]
    tot_nuc += len(seq_record)
    if seq_record.id:
        tot_gene += 1

print tot_gene ,"\t",tot_nuc