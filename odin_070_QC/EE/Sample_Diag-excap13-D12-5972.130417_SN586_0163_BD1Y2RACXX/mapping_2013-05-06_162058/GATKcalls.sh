#!/bin/bash
#
# You need to submit these commands separately by:
#-- logging into tor as SBSUser when running these commands
#-- giving the result files from the mapping the right rights (777) and ownerchip (SBSUser)
# If you do so the GATK result files will be generated at:
#--/condor_sh/gatk/results/<projectname>/<sample_id>/dpp/ for the data processing pipeline (re-alignment, dedup, and BQSR)
#--/condor_sh/gatk/results/<projectname>/<sample_id>/vc/ for the variant calling
# You can monitor the from GATK Queue submitted condor jobs by using condor_q (-run) on tor
# You can see the status of the Queue script by removing the -run and adding -status to the command
# If the Queue scripts fails, you can try to rerun it by removing the -startFromScratch from the command
#
################################################
# Data Processing Pipeline (IndelRealigner / MarkDuplicates / CountCovariates / TableRecalibration / AnalyzeCovariates)
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates -startFromScratch -run

#-> get status  
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates -status

#-> rerun 
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates  -run

################################################
# variant calling
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_VariationCallingPipeline_condor_V2.scala -I /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058//dpp/Sample_Diag-excap13-D12-5972.clean.dedup.recal.bam -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 8 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -dcov 250 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -keepIntermediates -startFromScratch -run

#-> get status  
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_VariationCallingPipeline_condor_V2.scala -I /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058//dpp/Sample_Diag-excap13-D12-5972.clean.dedup.recal.bam -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 8 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -dcov 250 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -keepIntermediates -status

#-> rerun
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_VariationCallingPipeline_condor_V2.scala -I /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058//dpp/Sample_Diag-excap13-D12-5972.clean.dedup.recal.bam -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 8 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -dcov 250 -p Project_DIAG-excap13-2013-04-09_bis -sample Sample_Diag-excap13-D12-5972 -keepIntermediates  -run


################################################
# if gatk mappimg is used
# /condor_sh/projects/Addisons/Addisons-excapHT-F7P8-KIT-Nv2/gatk_2012-10-22_133252/mapping/Addisons-excapHT-F7P8-KIT-Nv2_GCCAAT_L003.bam
################################################
# Data Processing Pipeline (IndelRealigner / MarkDuplicates / CountCovariates / TableRecalibration / AnalyzeCovariates)
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates -startFromScratch -run

#-> get status  
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates -status

#-> rerun 
java -Xmx1g -Djava.io.tmpdir=/condor_sh/gatk/tmp -jar /condor_sh/gatk/src_v1.4/dist/Queue.jar -S /condor_sh/gatk/src_v1.4/public/scala/qscript/org/broadinstitute/sting/queue/qscripts/NSC_DataProcessingPipeline_V2.scala -i /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam -R /condor_sh/gatk/ref/human_g1k_v37_decoy.fasta -D /condor_sh/gatk/ref/dbsnp_132.b37.vcf -nv -nrev -jobRunner Condor -jobSGDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -runDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -sg 24 -statusTo admin@ous.nsc.local -outputDir /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/gatk_2013-05-06_162058/ -p Project_DIAG-excap13-2013-04-09_bis -keepIntermediates  -run



