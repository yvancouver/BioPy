from Bio.Seq import Seq
from Bio.Alphabet import IUPAC
seq = raw_input("enter your sequence:  ")

my_s = Seq(seq)
print my_s
my_s.alphabet()
s2 = Seq('ACGTACGTACGTACGT', IUPAC.IUPACAmbiguousDNA())
try:
    assert (isinstance (IUPAC.Alphabet._get_base_alphabet(s2.alphabet), IUPAC.ExtendedIUPACDNA))
except AssertionError:
    print "wrong type"

isinstance (IUPAC.Alphabet._get_base_alphabet(s2.alphabet), IUPAC.ExtendedIUPACDNA)
#>>> False

my_seq = Seq(seq, IUPAC.extended_dna)

print "original\t\t", my_seq
print "complement\t\t", my_seq.complement()
print "reverse_complement\t", my_seq.reverse_complement()