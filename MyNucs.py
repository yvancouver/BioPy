from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
seq = raw_input("enter your sequence:  ")
my_seq = Seq(seq, IUPAC.unambiguous_dna)

print "original\t\t", my_seq
print "complement\t\t", my_seq.complement()
print "reverse_complement\t", my_seq.reverse_complement()