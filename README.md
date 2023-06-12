# learning_bioinformatics
Test scripts using Bash, Python and R for testing out bioinformatic pipelines on RNA-seq data.

The process is as follows:
1) Create a sub-directory called ./pipe/ in a Linux environment, and install anaconda/miniconda.
2) In terminal use conda activate to activate the conda environment, install SRA-toolkit.
4) In this directory organize it as follows:
```
./pipe/
├── counts
├── data
│   ├── fastq
│   │   └── PRJNA639275
│   │       └── trim_fastq_qc
│   └── PRJNA639275
│       ├── fastq
│       │   ├── SRR.fastqz.
│       ├── fastq_qc_1
│       │   ├── SRR_pass_fastqc.html
│       │   ├── SRR_pass_fastqc.zip
│       ├── hisat2
│       │   ├── SRR_pass_trimmed.bam
│       ├── quants
│       ├── trim
│       │   ├── SRR_pass_trimmed.fastq.gz
│       └── trim_fastq_qc
│           ├── SRR_pass_trimmed_fastqc.html
│           ├── SRR_pass_trimmed_fastqc.zip
├── HISAT2
│   ├── grch38
│   │   ├── genome.1.ht2
│   │   ├── genome.2.ht2
│   │   ├── genome.3.ht2
│   │   ├── genome.4.ht2
│   │   ├── genome.5.ht2
│   │   ├── genome.6.ht2
│   │   ├── genome.7.ht2
│   │   ├── genome.8.ht2
│   │   └── make_grch38.sh
│   └── grch38_genome.tar.gz
└── scripts
    ├── Fastq.py
    ├── SRA_file_move.sh
    ├── SRR_Acc_List.txt
    ├── SRR_download.py
    ├── Step_1_Step_2.sh
    ├── Step_3.sh
    └── Step_4.sh
```
3) Generate a .txt file in scripts that contains all SRR accension numbers from a specific bioproject, in this case "PRJNA639275" is being used.
4) Using the SRA toolkit, use python script to download the SRR files as listed in the SRR_Acc_List.txt file:
```
$python SRR_download.py
```
6) After this is done, run quality control using FASTQC and adapter trimming through trimmomatic using: 
```
$bash Step_1_Step_2.sh
```
7) Once that is completed, run a second quality control using FASTQC by: 
```
$bash Step_3.sh
```
9) Run sequence alignments using human genome as reference (grch38_genome) and then generate RNA-sequence transcripts count files through:
```
$bash Step_4.sh
```
11) More to be added.....
