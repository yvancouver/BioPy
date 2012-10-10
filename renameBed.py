import pybedtools
import sys
import re

def check_introns(genes_dic):
    # get the length of the dico , this in the number of intron
    # check the strand if minus/r rename exon from big to small
    # if positive/f rename from small to big
    # rename need to be on the name
    # NM_000364_cds_0_20_chr1_201328338_r
    pass

bed_file = pybedtools.BedTool("/Users/yvans/Home/Dropbox/travail/BED_GFF_INTERVALS/UseMe/Cardio/Ucsc_Coding_exons_Cardio_list_b37+-20.bed")
genes = []
feature = "None"

for line in bed_file:
    #print line
    #print line.start
    chrom = ""
    start = 0.1
    stop = 0.1
    
    colors = "255,0,0"
    i = 1
    notSee = True
    seed = re.compile("(NM_\d+)_cds_")
    result = seed.match(line.name)
    #print result.group(1) , line.name , feature
    #print type(result.group(1)) , type(feature)
    if feature != result.group(1):
        #print result.group(1)
        for intron in genes:
            print str(intron).strip()
        check_introns(genes)
        print
        print    
        genes = []
        genes.append(line)
        feature = result.group(1)

    else:
        genes.append(line)
