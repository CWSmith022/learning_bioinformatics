import os
import subprocess
import shutil

# Open SRR Accension .txt and turn into a list.
with open('SRR_Acc_List.txt', 'r') as file:
	sra_numbers = [line.strip() for line in file]

# Set the path to the output directory at Step 1
output_dir = '/stor/home/cws2927/data/SRA_files/'

# Create the output folder if it does not exist
# Check if the folder already exists
if not os.path.exists(output_dir):
    # Create the new folder
    os.mkdir(output_dir)

# Step 1) Iterate over all files in the SRR Accension folder ID list and use bash subprocess
for sra_id in sra_numbers:
    print("Currently downloading: " + sra_id)
    prefetch = "prefetch --output-directory {output_dir} {sra_id}".format(output_dir=output_dir, sra_id=sra_id)
    print("The command used was: " + prefetch)
    subprocess.call(prefetch, shell=True)

    # Move the downloaded .sra file from its subdirectory into the specified output directory
    src_path = os.path.join(output_dir, sra_id, sra_id + ".sra")
    dst_path = os.path.join(output_dir, sra_id + ".sra")
    shutil.move(src_path, dst_path)

    # Delete the subdirectory
    shutil.rmtree(os.path.join(output_dir, sra_id))

# Step 2) This will extract the .sra files from above into a folder named 'fastq'
for sra_id in sra_numbers:
    print ("Generating fastq for: " + sra_id)
    fastq_dump = "fastq-dump --outdir fastq --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip /stor/home/cws2927/data/SRA_files/" + sra_id + ".sra"
    print ("The command used was: " + fastq_dump)
    subprocess.call(fastq_dump, shell=True)