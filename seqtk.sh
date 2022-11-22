#subsample fastq
# -s is random seed, if you want same random fastq's 
#should be in .fq format, so first gunzip fq.gz
seqtk sample -s100 read1.fq 10000 > sub1.fq

#later can be gzip
gzip sub1.fq

