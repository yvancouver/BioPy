#for i in `find /Volumes/UNTITLED/testitest/ -type f -name "*snp.raw.snpFingerTest.vcf"` ; do echo $i ;py GenotypeFingerPrinting.py $i ;done

# First try to make a generic script which can capture these info from the vcf file

# SampleID
# HTS Ref base 
# HTS Alt base
# HTS AD (allele depth)
# HTS GT (genotype)


# This has to be capture from the TAq man
# Taqman genotype (hom/het)
# Taqman genotype in base (CT/TT?)

# How should I record the data?
#
# give the ooptio to get a particular 

import vcf
import sys
import collections

def namestr(obj, namespace):
    return [name for name in namespace if namespace[name] is obj]

def printKey(object):
    for key in object.keys():
        try:
            print "\t\t",key, "\t", object[key]
        except:
            print "key do not exist"

vcf_reader = vcf.Reader(open('/Users/yvans/Odin/data1/001_exome/diagnosticSamples/EE/Sample1/060_delivery/Sample_Diag-excap17-13000217701-KIT-AI50Mbv5.131009_7001448_0224_BC2G61ACXX.snp.raw.snpFingerPrintingTest.vcf', 'r'))
#vcf_reader = vcf.Reader(open(sys.argv[1], 'r'))
list_of_snps = {}
details_of_snp = collections.OrderedDict()

#rs = sys.argv[1]
for record in vcf_reader:
    ad = True
    #print rs, "\t=\t", record.ID
#    if record.ID == rs:
    #print record
    sample = vcf_reader.samples
    call = record.genotype(vcf_reader.samples[0])
    #print 'SAMPLES\t\t', vcf_reader.samples[0]
    #print 'SNP ID\t\t',record.ID
    #print 'HTS Ref base\t', record.REF
    #print "HTS Alt base\t",record.ALT[0]
    try:
            #print "HTS Genotype\t",call.gt_bases
            #print "HTS AD\t\t",call['AD']
            allelic_depth = call['AD']
    #        print "CALLED:",call.called, '\tGT_TYPE:', call.gt_type, '\tGT_BASES:',call.gt_bases, '\tGT_PHASE:',call.phased
    except:
            ad = False
            #print "NO AD"
            allelic_depth = [None,None]

    #print "CALLED:",call.called, '\tGT_TYPE:', call.gt_type, '\tGT_BASES:',call.gt_bases, '\tGT_PHASE:',call.phased

    if call.called:
            #print 'Number of READS for genotype\t',record.INFO['DP']
            read_depth = record.INFO['DP']
    else:
            #print 'SNP not called'
            read_depth = None
    #if ad:
    #        print 'Number of reads in AD\t\t' , int(call['AD'][0])+int(call['AD'][1])
    #else:
    #        print 'AD not called'
    
    details_of_snp[record.ID] = [record.REF,record.ALT,call.gt_bases,read_depth,allelic_depth,record.CHROM,record.POS]
    list_of_snps[vcf_reader.samples[0]] = details_of_snp
    #print"\n\n"
    
for key in list_of_snps.keys():
    #print list_of_snps[key].keys()
    #print list_of_snps[key]
    print key
    print "RS\tREF\tALT\tGenotype\treadDepth\tallelic depth REF\tallelic depth ALT\tCHROM\tPOS"

    for snp in list_of_snps[key].keys():
        
        #number_item = len(list_of_snps[key][snp])
        #print number_item
        
        print snp, "\t",list_of_snps[key][snp][0],"\t",str(list_of_snps[key][snp][1][0]),"\t",list_of_snps[key][snp][2],"\t",list_of_snps[key][snp][3],"\t",list_of_snps[key][snp][4][0],"\t",list_of_snps[key][snp][4][1],"\t",list_of_snps[key][snp][5],"\t",list_of_snps[key][snp][6]

