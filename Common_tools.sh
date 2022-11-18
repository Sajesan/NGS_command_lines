#list the files in a folder
ls FolderName 

#count lines in fastq files
wc -l FolderName/fastq.fq 
#keep it in a file
wc -l FolderName/fastq.fq > fastq.fq.count
head -n *.count



