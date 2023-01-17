###################################### Decompose vcf calls #####################################################
rule decompose:
    input:
        reference= referenceFile,
        vcf = rules.varscanGermline.output.varscanVcf
    output:
        vcf = "int/{sample}.decomposed.vcf"
    log:
        decompositionLog = "logs/{sample}.decomposition.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "01:00:00"
    container:
        singularity_vt
    shell:
        """
        bgzip -@ {threads} -c {input.vcf} > {input.vcf}.gz && \
        tabix -p vcf {input.vcf}.gz && \
        vt decompose -s {input.vcf}.gz -o {output.vcf} > {log.decompositionLog}
        """
