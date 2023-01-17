###################################### Varscan over a somatic pileup ###########################################
rule varscanGermline:
    input:
        pileup = rules.germlinePileup.output.pileup,
    output:
        varscanVcf = "int/{sample}.varscan.germline.vcf"
    log:
        error = "logs/{sample}_varscan.Germline.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "04:00:00"
    container:
        singularity_java
    shell:
         "java $JVM_ARGS -jar {varscanLib} mpileup2snp {input.pileup} --min-var-freq 0.1 --p-value 1.00 --strand-filter 0 --output-vcf 1 --min-coverage 10 > {output.varscanVcf} 2> {log.error}"
