#!/bin/bash

SECONDS=0

# change working directory
cd /stor/home/cws2927/pipe/

# Input directory of fastq.gz files
fastq_dir="/stor/home/cws2927/pipe/data/PRJNA639275/trim" 

# STEP 3: Run fastqc on trimmed data
## Output dir for fastqc
output_dir="/stor/home/cws2927/pipe/data/PRJNA639275/trim_fastq_qc" 
## Make directory if it doesn't already exist.
mkdir -p $output_dir
## Run Fastq on each .fastq.gz file in the specified directory
for file in $fastq_dir/*.fastq.gz; do
	fastqc -o $output_dir $file
done

echo "Trimmomatic finished running!"

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."