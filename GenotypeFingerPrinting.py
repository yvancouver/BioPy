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
vcf_reader = vcf.Reader(open(sys.argv[1], 'r'))
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
            allelic_depth = None

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
    for snp in list_of_snps[key].keys():
        print "\t", snp, list_of_snps[key][snp]

#for snp in sorted(list_of_snps[key],key=list_of_snps[key].get):
    #print snp, list_of_snps[key][snp]
        #print "RECORD ",type(record)
        #print "RECORD NAME ",namestr(record,globals())
#    if record.ID == "rs3108237":
 #       print "SampleID: " , vcf_reader.samples
#        print "HTS Ref base ",record.REF
#        print "HTS Alt base ",record.ALT
#        print "HTS DP" , record.INFO['DP']
        #print "AD (allele depth) " , record.FORMAT,record.samples
#        call = record.genotype(vcf_reader.samples[0])
        #print "SAMPLES ",record.samples
        #print "CALL SITE " ,call.site
        #print "CALL DATA " ,call.data
#        print "HTS AD (allele depth) " ,call.data[1]
#        print "HTS GT (genotype) " ,call.data[0]
        #print "record\t\t",record
        #print "record.CHROM \t",record.CHROM
        #print "record.POS \t", record.POS
        #print 'record.ID \t',record.ID
        #print 'record.REF \t', record.REF
        #print "record.ALT\t",record.ALT
        #print "record.QUAL\t",record.QUAL
        #print "record.FILTER\t",record.FILTER
        #print "record.INFO\t",record.INFO
        #print type(record.INFO)
        #printKey(record.INFO)
#        for key in record.INFO.keys():
#            print "\t\t",key
#        print record.INFO['MLEAC']
#        print record.INFO['AC']
#        print record.INFO['BaseQRankSum']
#        print record.INFO['MLEAF']
#        print record.INFO['AF']
#        print record.INFO['DB']
#        print record.INFO['AN']
#        print record.INFO['MQ0']
#        print record.INFO['Dels']
#        print record.INFO['FS']
#        print record.INFO['MQ']
#        print record.INFO['QD']
#        print record.INFO['SB']
#        print record.INFO['HaplotypeScore']
#        print record.INFO['MQRankSum']
#        print record.INFO['DS']
#        print record.INFO['DP']
#        print record.INFO['ReadPosRankSum']
        #print "record.FORMAT\t",record.FORMAT
        
        #print "record.samples\t",record.samples
        #for sample in vcf_reader.samples:
        #    print "\t\tsample \t",sample

        #print "record.genotype\t",record.genotype('Sample_Diag-excap17-13000217701-KIT-AI50Mbv5')
        #sample = vcf_reader.samples[0]
        #call = record.genotype(vcf_reader.samples[0])
        #print "\t\tSample ",call.sample, "\n\t\tSite ",call.site, "\n\t\tCall ",call.data, 
        #try:
        #    print "\n\t\t\tGT\t",call['GT']
        #    print "\n\t\t\tAD\t",call['AD']
        #    print call.called, call.gt_type, call.gt_bases, call.phased
        #except:
        #    print "NO AD"
        #print "type record.FORMAT\t",type(record.FORMAT)
        #print "type record.samples\t",type(record.samples[0])
        #print "type record.genotype\t",type(record.genotype)
        #for key in vcf_reader.metadata.keys():
        #    print "\t",key, "=", type(vcf_reader.metadata[key][0]),len(vcf_reader.metadata[key][0])
        #    '''
        #    for content in vcf_reader.metadata['UnifiedGenotyper'][0]:
        #        print content
        #    '''




'''
Taqman genotype (hom/het)
Taqman genotype in base (CT/TT?) 
?
?
'''
