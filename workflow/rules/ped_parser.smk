rule ped_parser:
    input:
        "../../pedigrees/{sample}_pedigree.ped"
    output:
        protected("../results/ready_for_scout/{sample}.ped.data")
    params:
        "--to_madeline"
    log: 
        "logs/ped_parser/{sample}.log"
    benchmark:
        "benchmarks/ped_parser/{sample}.tsv"
    conda:
        "../envs/ped_parser.yaml"
    message:
        "Preparing files ({input}) in order to create a pedigree drawing tree"
    shell:
        "ped_parser {input} {params} --outfile {outfile} &> {log}"