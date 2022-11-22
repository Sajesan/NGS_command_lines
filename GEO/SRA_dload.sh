nextflow run nf-core/fetchngs -r 1.4 --input id.txt --outdir ./ -profile singularity


#####################################################################################################################################
#Download individual fastqfile of the run
SRR=SRR13815253
curl -X GET "https://www.ebi.ac.uk/ena/portal/api/filereport?accession=$SRR&fields=fastq_ftp&result=read_run"

#gives following results
run_accession	fastq_ftp
SRR13815253	ftp.sra.ebi.ac.uk/vol1/fastq/SRR138/053/SRR13815253/SRR13815253_1.fastq.gz;ftp.sra.ebi.ac.uk/vol1/fastq/SRR138/053/SRR13815253/SRR13815253_2.fastq.gz

#use the fastw_ftp section to download the individual fastq file under that run 
URL1=https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR138/053/SRR13815253/SRR13815253_1.fastq.gz
wget $URL1

URL2=https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR138/053/SRR13815253/SRR13815253_2.fastq.gz
wget $URL2
#####################################################################################################################################
