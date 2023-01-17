######################### Mark Duplicates ####################################

rule markDuplicates:
    input:
        sortedBam = "resources/{sample}.bam",
        index     = "resources/{sample}.bam.bai",
        picardLib = picardLib
    output:
        bam       = "int/{sample}.markDuplicates.bam",
        metrics   = "qc/{sample}.markDuplicates.metrics.txt"

    log:
        l = "logs/{sample}.markDuplicates.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "01:00:00",
#        partition = "bigmem",
#        queue = "bigmem"
    container:
        singularity_java
    shell:
        "java $JVM_ARGS -jar {input.picardLib} MarkDuplicates I={input.sortedBam} O={output.bam} METRICS_FILE={output.metrics} SORTING_COLLECTION_SIZE_RATIO=0.125 MAX_RECORDS_IN_RAM=250000 > {log.l}"
