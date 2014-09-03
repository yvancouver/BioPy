#!/bin/bash
#./bam polishBam --in /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.bam --out /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam --log /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam.log --checkSQ --fasta /condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17 --UR /condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17 

tempHeaderFile=/condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//tempHeader.txt
stringToAddToSQ="UL:/condor_sh/novoalign/ref/novoalignRefDecoy_V2.07.17"


# create the new header by get the existing one and adding the reference info
# awk to fix the tab issue (tried sed but could not get it to work)
samtools view -H /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.bam | awk -v toadd=${stringToAddToSQ} 'BEGIN{OFS="\t"};{if($0 ~/^@SQ/){print $0, toadd}else{print $0}}'  > $tempHeaderFile


# change the header using samtools
samtools reheader $tempHeaderFile /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.bam > /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam
samtools index /condor_sh/projects/Project_DIAG-excap13-2013-04-09_bis/Sample_Diag-excap13-D12-5972/mapping_2013-05-06_162058/results//130417_SN586_0163_BD1Y2RACXX_Sample_Diag-excap13-D12-5972_GCCAAT_L005.posiSrt.updatedHeader.bam

# cleanup
#rm -f $tempHeaderFile

