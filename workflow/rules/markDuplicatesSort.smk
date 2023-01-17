###################################### Sort bam with marked duplicates #########################################
rule markedDuplicatesSort:
	input:
		unsortedBam = rules.markDuplicates.output.bam
	output:
		sortedBam = "int/{sample}.markDuplicates.sorted.bam"
	log:
		"logs/{sample}.sort.log"
	threads:
		2
#	resources:
#		mem = "80GB",
#		time = "01:00:00"
	container:
		singularity_samtools
	shell:
		"samtools sort -@ {threads} -m 100M -O BAM -o {output.sortedBam} {input.unsortedBam}"
