# pass file containing fasta entry 
# and the script returns seq name, length and gene name 
# based on the cardio_dict

import cardio_dict
from Bio import SeqIO

for seq_record in SeqIO.parse("//Users/yvans/Home/Dropbox/travail/BED_GFF_INTERVALS/UseMe/Cardio/FinalFiles/AllCardio.fasta", "fasta"):
    print seq_record.id,"\t", len(seq_record),"\t",cardio_dict.Cardio_dict[seq_record.id[:-2]]