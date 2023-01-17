rule a:
    input:
        sortedBam = "resources/" + "{sample}.bam",
    output:
        bamBai = "results/" + "{sample}.bam.bai",
    log:
        l = "logs/" + "{sample}.log",
    container:
        singularity_java
    shell:
        "date > {output.bamBai}"
