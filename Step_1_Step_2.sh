#!/bin/bash

SECONDS=0

# change working directory
cd /stor/home/cws2927/pipe/

# Input directory of fastq.gz files
fastq_dir="/stor/home/cws2927/pipe/data/PRJNA639275/fastq" 

# STEP 1: Run fastqc
## Output dir for fastqc
output_dir="/stor/home/cws2927/pipe/data/fastq/PRJNA639275/fastq_qc" 
## Make directory if it doesn't already exist.
mkdir -p $output_dir
## Run Fastq on each .fastq.gz file in the specified directory
for file in $fastq_dir/*.fastq.gz; do
	fastqc -o $output_dir $file
done

# STEP 2: Run trimmomatic to trim reads with poor quality
## Output dir for trimmomatic
output_dir_trim="/stor/home/cws2927/pipe/data/PRJNA639275/trim/" 

### Make directory if it doesn't already exist
mkdir -p $output_dir_trim

## Trimmomatic.jar directory 
trim_dir="/stor/home/cws2927/Trimmomatic-0.38/trimmomatic-0.38.jar" 

## Specify which Illumina adapters need to be clipped
adapter_file_dir="/stor/home/cws2927/Trimmomatic-0.38/adapters/NexteraPE-PE.fa" 

## Run trimmomatic on each .fastq.gz file in the specified directory to remove adapters
for file in $fastq_dir/*.fastq.gz; do
	### Generate output file name for trimmed reads
	trim_output_file="$output_dir_trim/$(basename $file .fastq.gz)_trimmed.fastq.gz" 
	java -jar $trim_dir SE -phred33 $file $trim_output_file ILLUMINACLIP:$adapter_file_dir:2:30:10 LEADING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
	
echo "Trimmomatic finished running!"

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
