rule madeline2:
    input:
        "../results/ready_for_scout/{sample}.ped.data"
    output:
        protected("../results/ready_for_scout/{sample}_pedigree.xml")
    params:
        "--outputext xml --color"
    log: 
        "logs/madeline2/{sample}.log"
    benchmark:
        "benchmarks/madeline2/{sample}.tsv"
    singularity:
        "shub://leahkemp/madeline2_container:latest"
    message:
        "Drawing a pedigree based on {input}"
    shell:
        """
        madeline2 {input} -L "IndividualId Affected" {input} {params} &> {log}
        """