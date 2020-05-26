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
        other = "--info-key CNN_1D --snp-tranche 80.00 --snp-tranche 81.00 --snp-tranche 82.00 --snp-tranche 83.00 --snp-tranche 84.00 --snp-tranche 85.00 --snp-tranche 86.00 --snp-tranche 87.00 --snp-tranche 88.00 --snp-tranche 89.00 --snp-tranche 90.00 --snp-tranche 91.00 --snp-tranche 92.00 --snp-tranche 93.00 --snp-tranche 94.00 --snp-tranche 95.00 --snp-tranche 96.00 --snp-tranche 97.00 --snp-tranche 98.00 --snp-tranche 99.00 --snp-tranche 100.00 --indel-tranche 80.00 --indel-tranche 81.00 --indel-tranche 82.00 --indel-tranche 83.00 --indel-tranche 84.00 --indel-tranche 85.00 --indel-tranche 86.00 --indel-tranche 87.00 --indel-tranche 88.00 --indel-tranche 89.00 --indel-tranche 90.00 --indel-tranche 91.00 --indel-tranche 92.00 --indel-tranche 93.00 --indel-tranche 94.00 --indel-tranche 95.00 --indel-tranche 96.00 --indel-tranche 97.00 --indel-tranche 98.00 --indel-tranche 99.00 --indel-tranche 100.00"
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