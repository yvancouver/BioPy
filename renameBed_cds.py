#!/usr/bin/python
import pybedtools
import sys
import re
import cardio_dict

def check_exons(exons_list,strand):
    # get the length of the dico , this in the number of intron
    # check the strand if minus/r rename exon from big to small
    # if positive/f rename from small to big
    # rename need to be on the name
    # NM_000364_cds_0_20_chr1_201328338_r
    # to 
    # NM_004949_DSC2_6_20_r    0    -
    number_exons = len(exons_list)
    pattern = re.compile("(NM_\d+)_cds_(\d+)(_\d+)_chr\d+_\d+_(\w)")
    i = 0
    for exon in exons:
        if exon.strand == "+":
            result = pattern.match(exon.name)
            print exon.chrom+"\t"+str(exon.start)+"\t"+str(exon.stop)+"\t"+cardio_dict.Cardio_dict[result.group(1)]+"_"+result.group(1)+"_exon_"+str(i+1)+"_"+result.group(4)+"\t"+exon.score+"\t"+exon.strand
            i += 1
        else:
            result = pattern.match(exon.name)
            print exon.chrom+"\t"+str(exon.start)+"\t"+str(exon.stop)+"\t"+cardio_dict.Cardio_dict[result.group(1)]+"_"+result.group(1)+"_exon_"+str(number_exons-i)+"_"+result.group(4)+"\t"+exon.score+"\t"+exon.strand
            i += 1
#bed_file = pybedtools.BedTool("/Users/yvans/Home/Dropbox/travail/BED_GFF_INTERVALS/UseMe/Cardio/Ucsc_Coding_exons_Cardio_list_b37+-20.bed")
bed_file = pybedtools.BedTool(sys.argv[1])
exons = []
feature = "None"
strand_dict ={'f':"+", 'r':"-"}
strand_letter = ""
seed = re.compile("(NM_\d+)_cds_\d+_\d+_chr\d+_\d+_(\w)")
for line in bed_file:
    result = seed.match(line.name)
    if feature != result.group(1):
        check_exons(exons,strand_letter)
        exons = []
        exons.append(line)
        feature = result.group(1)
        strand_letter = result.group(2)
        strand_sign = line.strand
    else:
        if strand_letter != result.group(2):
            sys.exit("WRONG STRAND")
        exons.append(line)
check_exons(exons,strand_letter)
