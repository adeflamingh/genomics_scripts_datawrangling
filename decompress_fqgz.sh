#!/bin/bash
#SBATCH -p normal
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -J fq_decompress
#SBATCH -D /home/labs/SE/decompressed
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=deflami2@illinois.edu
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --array=0-15%5

set -euo pipefail

# Get list of files
FILES=(*.fastq.gz )

# Select file based on SLURM task ID
FILE="${FILES[$SLURM_ARRAY_TASK_ID]}"

echo "[$(date)] Decompressing $FILE"

# Decompress without deleting original
gunzip -c "$FILE" > "${FILE%.gz}"

echo "[$(date)] Finished $FILE"
