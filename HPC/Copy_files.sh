#Copy files from a remote directory to another remote directory
sshpass -p "(Provide password here)" \
scp -r sajesan@cheaha.rc.uab.edu:path/*.gz \
sajesan@cheaha.rc.uab.edu:path/rawdata/