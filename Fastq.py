import os
import subprocess
import shutil

# Open SRR Accension .txt and turn into a list.
with open('SRR_Acc_List.txt', 'r') as file:
	sra_numbers = [line.strip() for line in file]

# Step 2) This will extract the .sra files from above into a folder named 'fastq'
for sra_id in sra_numbers:
    print ("Generating fastq for: " + sra_id)
    fastq_dump = "fastq-dump --outdir fastq --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip /stor/home/cws2927/data/SRA_files/" + sra_id + ".sra"
    print ("The command used was: " + fastq_dump)
    subprocess.call(fastq_dump, shell=True)