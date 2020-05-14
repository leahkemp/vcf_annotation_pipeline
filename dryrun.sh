#!/bin/bash -x

snakemake \
-n -j 24 \
--use-conda \
--use-singularity \
--singularity-args '-B /store/lkemp/' \
--configfile ./config/GRCh38_single_WES_benchmarking_config.yml