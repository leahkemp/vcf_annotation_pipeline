`vcf_annotation_pipeline <https://github.com/ESR-NZ/vcf_annotation_pipeline>`_ filters raw variants (snp and indels) and annotates variant call format (VCF) files (single samples or cohorts) using `GATK4 <https://gatk.broadinstitute.org/hc/en-us>`_, `SnpSift <http://snpeff.sourceforge.net/SnpSift.html>`_, `VEP <https://asia.ensembl.org/info/docs/tools/vep/index.html>`_, `genmod <http://moonso.github.io/genmod/>`_ and `dbSNP <https://www.ncbi.nlm.nih.gov/snp/>`_. The vcf file is also prepared for ingestion into `scout <http://www.clinicalgenomics.se/scout/>`_ which involves some filtering steps. However a vcf file is also output after annotation and before this preparation for scout. This workflow is designed to follow the `GATK best practice workflow for germline short variant discovery (SNPs + Indels) <https://gatk.broadinstitute.org/hc/en-us/articles/360035535932-Germline-short-variant-discovery-SNPs-Indels->`_ and is designed to be used after `human_genomics_pipeline <https://github.com/ESR-NZ/human_genomics_pipeline>`_.

Run parameters:
    * Reference genome build: {{ snakemake.config["BUILD"] }}
    * Input data type: {{ snakemake.config["DATA"] }}
    * Reference genome: {{ snakemake.config["REFGENOME"] }}
    * dbSNP database {{ snakemake.config["dbSNP"] }}
