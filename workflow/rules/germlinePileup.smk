###################################### Pileup, tumor normal pair ###############################################
rule germlinePileup:
    input:
        bam = "int/{sample}.markDuplicates.sorted.bam",
        reference = referenceFile
    output:
        pileup = "int/{sample}.pileup"
    log:
        "logs/{sample}.germlinePileup.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "10:00:00"
    container:
        singularity_samtools
    shell:
        "samtools mpileup -P {threads} -B -d 9001 -q 1 -f {input.reference} -o {output.pileup} {input.bam} "

