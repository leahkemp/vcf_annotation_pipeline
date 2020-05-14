#!/bin/bash -x

snakemake \
--report report.html \
--configfile ./config/GRCh38_single_WES_benchmarking_config.yml \
--report-stylesheet ESR_stylesheet.css