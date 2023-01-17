###################################### Normalise_index vcf calls ######################################################
rule normalise_index:
    input:
        vcf = rules.normalise.output.vcf
    output:
        vcfgz = "int/{sample}.normalised.vcf.gz",
        vcftbi = "int/{sample}.normalised.vcf.gz.tbi",
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
        bgzip -@ {threads} -c {input.vcf} > {output.vcfgz} && tabix -p vcf {output.vcfgz}
        """
