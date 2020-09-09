rule peddy:
    input:
        vcf = "../results/annotated/{sample}_filtered_annotated.vcf",
        pedigree = "../../pedigrees/{sample}_pedigree.ped"
    output:
        protected("../results/ready_for_scout/{sample}.sex_check.csv")
    params:
        "--plot --prefix {sample}"
    log: 
        "logs/peddy/{sample}.log"
    benchmark:
        "benchmarks/peddy/{sample}.tsv"
    conda:
        "../envs/peddy.yaml"
    threads: 8
    message:
        "Comparing familial-relationships and sexes as reported in {input.pedigree}"
    shell:
        "peddy {input.vcf} -p {threads} {params} {input.vcf} {input.pedigree} &> {log}"