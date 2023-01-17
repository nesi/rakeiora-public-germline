###################################### Annotate ######################################

#include: "annotate.snk"
# function needs to go here to enable this stage to pick up input from either germline or somatic threads.
# input within the rule will accept a function call/values returned by a function call as inputs.
# This should possibly go in the decompose stage?

def get_input(wildcards):
    input_list = []
    if config["DEG"]["exec"]:
          input_list.append("DEG/DEG.txt")
    if config["DTU"]["exec"]:
          input_list.append("DTU/DTU.txt")
    return input_list

rule annotate:
    input:
        vcf = rules.normalise_index.output.vcfgz
    output:
        annotatedVcf = "results/{sample}.annotated.vcf",
    log:
        annotationLogs = "logs/{sample}.annotation.log"
    threads:
        2
#    resources:
#        mem = "80GB",
#        time = "01:00:00"
    #container:
    #    "docker://mcfonsecalab/variantutils:0.6"
    container:
        singularity_vt2
    shell:
        """
            vcfanno -p {threads} {vcfannoConfig} {input.vcf} > {output.annotatedVcf} 2>{log.annotationLogs}
        """
