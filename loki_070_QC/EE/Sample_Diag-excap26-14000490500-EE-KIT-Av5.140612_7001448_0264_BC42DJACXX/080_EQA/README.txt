##### Coverage

MEAN_TARGET_COVERAGE    170,77358

##### Sample analysis

We implement gene panel based whole exome sequencing (WES) for clinical diagnostics in the department. That is, the sequencing and variant calling of the sample are whole-exome based. However, we only interperate variants located in the candidate genes (the genes in the gene panel). As we use Agilent SureSelect capture kit for exon capture, some intronic regions are also captured and we do variant calling on all captured regions with 50 bp flanking regions on both ends. These will include some intronic variants which are away from exon/intron junction more than 2 bp. We have talked this issue with Patton Simon. He suggests us to do what we normally do. This is the reason why we provide all variants.

##### Conversion from VCF format to BED format

We used "BEDOPS" vcf2bed for conversion from VCF format to BED format. It converts 1-based, closed [a, b] VCF v4 data from standard input into 0-based, half-open [a-1, b) extended BED, sent to standard output. The eight, fixed mandatory columns in the VCF format are converted to BED data as follows:

     - Data in the #CHROM column are mapped to the first column of the BED output
     - The POS column is mapped to the second and third BED columns
     - The ID and QUAL columns are mapped to the fourth and fifth BED columns, respectively
     - The REF, ALT, FILTER and INFO are mapped to the sixth through ninth BED columns, respectively
     - If present, genotype data in FORMAT and subsequence sample IDs are placed into tenth and subsequent columns

The reference for BEDOPS:

Shane Neph, M. Scott Kuehn, Alex P. Reynolds, et al. BEDOPS: high-performance genomic feature operations. Bioinformatics (2012) 28 (14): 1919-1920. doi: 10.1093/bioinformatics/bts277

