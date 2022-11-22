#list the files in a folder
ls FolderName 

#count lines in fastq files
wc -l FolderName/fastq.fq 
#keep it in a file
wc -l FolderName/fastq.fq > fastq.fq.count
head -n *.count

#Count files in current directory
#To determine how many files there are in the current directory, put in ls -1 | wc -l. This uses wc to do a count of the number of lines (-l) in the output of ls -1. It doesn't count dotfiles. Please note that ls -l (that's an "L" rather than a "1" as in the previous examples) which I used in previous versions of this HOWTO will actually give you a file count one greater than the actual count. Thanks to Kam Nejad for this point.
#If you want to count only files and NOT include symbolic links (just an example of what else you could do), you could use ls -l | grep -v ^l | wc -l (that's an "L" not a "1" this time, we want a "long" listing here). grep checks for any line beginning with "l" (indicating a link), and discards that line (-v).
ls -l | grep -v ^l | wc -l 

