#!/usr/bin/perl -w
use strict;

my @folders = glob "Sample_*";

foreach my $eachFolder(@folders){

  chdir("$eachFolder/compare/annotation/");
  
  open OUT, ">> ../Procedure.txt" or die;
  my $newFile = join '.', $eachFolder, "uniqueUG2-8-1.inCand.hg19_multianno.freq.2.1pre.txt";
  print OUT "cp uniqueNewVSold1st.inCand.hg19_multianno.freq.txt ../../060_delivery/$newFile\n";
  system "cp uniqueNewVSold1st.inCand.hg19_multianno.freq.txt ../../060_delivery/$newFile";
  close OUT;

  chdir("../../../");

}
