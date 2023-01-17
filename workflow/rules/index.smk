#################### Matt's preliminary index step ###########################
rule initialIndexOfBAM:
    input:
        sortedBam = "resources/{sample}.bam",
    output:
        bamBai = "resources/{sample}.bam.bai",
    log:
        l= "logs/{sample}.bamindex.log"
    threads:
        2
    container:
        singularity_samtools
    shell:
        "samtools index -@ {threads} -m 100M {input.sortedBam} {output.bamBai} >{log.l}"
