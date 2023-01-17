###################################### Filter ######################################

rule filter:
    input:
        vcf = rules.annotate.output.annotatedVcf
    output:
        filteredVcf = "results/{sample}.filtered.vcf",
    log:
        filteringLogs = "logs/{sample}.filtering.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "01:00:00"
    #container:
    #    "docker://mcfonsecalab/variantutils:0.6"
    container:
        singularity_vt2
#bcftools view -e'clinvarDiseaseName=""' -f'* [ %clinvarDiseaseName]\n | gnomADAlleleCount=""' -f'* [ %gnomadADAlleCount]\n ' {input.vcf} -o {output.filteredVcf} > {log.filteringLogs}
    shell:
        """
            bcftools view {input.vcf} -o {output.filteredVcf} > {log.filteringLogs}
        """
