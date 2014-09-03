#!/bin/bash
#
#java -Xmx4g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar 
#-S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/AlignWithBWA.scala 
#-f /condor_sh/projects/Addisons/Addisons-excapHT-F7P8-KIT-Nv2/data/ 
#-R /condor_sh/bwa/ref/0.5/human_g1k_v37_decoy.fasta 
#-jobRunner Condor 
#-jobSGDir /condor_sh/projects/Addisons/Addisons-excapHT-F7P8-KIT-Nv2/mapping_gatk_2012-09-20_123107/ 
#-runDir /condor_sh/projects/Addisons/Addisons-excapHT-F7P8-KIT-Nv2/mapping_gatk_2012-09-20_123107/ 
#-outputDir /condor_sh/projects/Addisons/Addisons-excapHT-F7P8-KIT-Nv2/mapping_gatk_2012-09-20_123107/ 
#-p Addisons 
#-sample Addisons-excapHT-F7P8-KIT-Nv2 
#-rg "@RG\tID:Addisons-excapHT-F7P8-KIT-Nv2\tCN:NSC\tDS:Addisons\tDT:2012-08-17\tPU:BC10WBACXX.L003\tPL:ILLUMINA\tSM:Addisons-excapHT-F7P8-KIT-Nv2\tLB:Addisons-excapHT-F7P8-KIT-Nv2" 
#-bwa /condor_sh/bwa/src/X86_64/LINUX/bwa-0.5.10_MT/bwa 
#-bt 4 
#-statusTo admin@ous.nsc.local -keepIntermediates -startFromScratch -run
#
################################################
# Mapping: bwa aln, sampe/samse,  
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_Lite/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_AlignWithBWA.scala -f /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/data/ -R /condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -rg "@RG\tID:Sample_Diag-excap13-D12-5972\tCN:NSC\tDS:Project_DIAG-excap13-2013-04-09_bis\tDT:2013-04-17\tPU:BD1Y2RACXX.L005\tPL:ILLUMINA\tSM:Sample_Diag-excap13-D12-5972\tLB:Sample_Diag-excap13-D12-5972" -bwa /condor_sh/bwa/src/X86_64/LINUX/bwa-0.5.10_MT/bwa -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -bt 3 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -keepIntermediates -startFromScratch -run

#-> get status  
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_Lite/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_AlignWithBWA.scala -f /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/data/ -R /condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -rg "@RG\tID:Sample_Diag-excap13-D12-5972\tCN:NSC\tDS:Project_DIAG-excap13-2013-04-09_bis\tDT:2013-04-17\tPU:BD1Y2RACXX.L005\tPL:ILLUMINA\tSM:Sample_Diag-excap13-D12-5972\tLB:Sample_Diag-excap13-D12-5972" -bwa /condor_sh/bwa/src/X86_64/LINUX/bwa-0.5.10_MT/bwa -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -bt 3 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -keepIntermediates -status

#-> rerun 
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_Lite/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_AlignWithBWA.scala -f /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/data/ -R /condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -rg "@RG\tID:Sample_Diag-excap13-D12-5972\tCN:NSC\tDS:Project_DIAG-excap13-2013-04-09_bis\tDT:2013-04-17\tPU:BD1Y2RACXX.L005\tPL:ILLUMINA\tSM:Sample_Diag-excap13-D12-5972\tLB:Sample_Diag-excap13-D12-5972" -bwa /condor_sh/bwa/src/X86_64/LINUX/bwa-0.5.10_MT/bwa -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -bt 3 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/mapping/ -keepIntermediates -run

