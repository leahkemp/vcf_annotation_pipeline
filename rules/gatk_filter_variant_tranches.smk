# Add more resources
rule gatk4_FilterVariantTranches:
    input:
        vcf = "filtered/{sample}_scored.vcf" 
    output:
        "filtered/{sample}_filtered.vcf"
    params:
        tdir = expand("{tdir}", tdir = config['TEMPDIR']),
        padding = expand("{padding}", padding = config['WES']['PADDING']),
        intervals = expand("{intervals}", intervals = config['WES']['INTERVALS']),
        resources = expand ("{resources}", resources = config['FILTERING']['SINGLE']),
        other = "--info-key CNN_2D --snp-tranche 70.00 --snp-tranche 71.00 --snp-tranche 72.00 --snp-tranche 73.00 --snp-tranche 74.00 --snp-tranche 75.00 --snp-tranche 76.00 --snp-tranche 77.00 --snp-tranche 78.00 --snp-tranche 79.00 --snp-tranche 80.00 --snp-tranche 81.00 --snp-tranche 82.00 --indel-tranche 70.00 --indel-tranche 71.00 --indel-tranche 72.00 --indel-tranche 73.00 --indel-tranche 74.00 --indel-tranche 75.00 --indel-tranche 76.00 --indel-tranche 77.00 --indel-tranche 78.00 --indel-tranche 79.00 --indel-tranche 80.00 --indel-tranche 81.00 --indel-tranche 82.00"
    log:
        "logs/gatk_filter_variant_tranches/{sample}.log"
    benchmark:
        "benchmarks/gatk_filter_variant_tranches/{sample}.gatkfiltervartranch"
    singularity:
        "docker://broadinstitute/gatk:4.1.7.0"
    message:
        "Applying tranche filtering to variant calls"
    shell:
        "gatk FilterVariantTranches -V {input.vcf} -O {output} --tmp-dir {params.tdir} {params.padding} {params.intervals} {params.resources} {params.other}"