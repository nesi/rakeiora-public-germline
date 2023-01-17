###################################### Normalise vcf calls ######################################################
rule normalise:
    input:
        reference= referenceFile,
        vcf = rules.decompose.output.vcf
    output:
        vcf = "int/{sample}.normalised.vcf"
    log:
        normalisationLog = "logs/{sample}.normalisation.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "01:00:00"
    container:
        singularity_vt
    shell:
        """
        vt normalize {input.vcf} -r {input.reference} -o {output.vcf} > {log.normalisationLog}
        """
