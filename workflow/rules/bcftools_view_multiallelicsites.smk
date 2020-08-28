if config['DATA'] == "Single" or config['DATA'] == 'single':
    outfile = temp("../results/filtered/{sample}_filtered_scoutfiltered.vcf")
elif config['DATA'] == "Cohort" or config['DATA'] == 'cohort':
    outfile = temp("../results/filtered/{sample}_filtered_multiallelicsites.vcf.gz")

rule bcftools_view_multiallelicsites:
    input:
        "../results/filtered/{sample}_filtered.vcf" 
    output:
        outfile
    params:
        "-O z --max-alleles 2 --exclude-types indels"
    log:
        "logs/bcftools_view_multiallelicsites/{sample}.log"
    benchmark:
        "benchmarks/bcftools_view_multiallelicsites/{sample}.tsv"
    conda:
        "../envs/bcftools.yaml"
    message:
        "Filtering out multiallelic sites"
    shell:
        "bcftools view {params} {input} > {output}"