###################################### Index sorted bam with marked duplicates #################################
rule markedDuplicatesIndex:
    input:
        sortedBam = rules.markedDuplicatesSort.output.sortedBam
    output:
        bamIndex = "int/{sample}.markDuplicates.sorted.bam.bai"
    log:
        markDuplicatesIndexLog= "logs/{sample}.index.log"
    threads:
       2
#    resources:
#        mem = "80GB",
#        time = "04:00:00"
    container:
        singularity_samtools
    shell:
        "samtools index -@ {threads} -m 100M {input.sortedBam} {output.bamIndex} >{log.markDuplicatesIndexLog}"
