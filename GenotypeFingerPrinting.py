import vcf


vcf_reader = vcf.Reader(open('/Users/yvans/Odin/data1/001_exome/diagnosticSamples/EE/Sample1/060_delivery/Sample_Diag-excap17-13000217701-KIT-AI50Mbv5.131009_7001448_0224_BC2G61ACXX.snp.raw.snpFingerPrintingTest.vcf', 'r'))
for record in vcf_reader:
    if record.ID == "rs3108237":
        print "SampleID: " , vcf_reader.samples
        print "HTS Ref base ",record.REF
        print "HTS Alt base ",record.ALT
        print "HTS DP" , record.INFO['DP']
        #print "AD (allele depth) " , record.FORMAT,record.samples
        call = record.genotype(vcf_reader.samples[0])
        #print "SAMPLES ",record.samples
        #print "CALL SITE " ,call.site
        #print "CALL DATA " ,call.data
        print "HTS AD (allele depth) " ,call.data[1]
        print "HTS GT (genotype) " ,call.data[0]
        print '''

Taqman genotype (hom/het)
Taqman genotype in base (CT/TT?) 
?
?
'''
