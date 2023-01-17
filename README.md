# Rakeiora Workflow Template: `Germline`

[![Rakeiora](http://rakeiora.ac.nz)](http://rakeiora.ac.nz)

A template workflow for Rakeiora - this is workflow 1 - Germline

## Usage

- One input for this workflow needs to be defined: It requires READS, can be
single or multi select, should be restricted to NORMAL samples, and merged BY SAMPLE.
- the sandbox and portal will retrieve input data and put into the /resources directory
- The annotated VCFs and the filtered VCFs go to the results directory
- the sandbox and portal copy results and logs directories to the jupyter hub for your inspection
- any environment settings ($TMP, JVM parameters, etc) go into the config/env file
- Note that this workflow would not be acceptable in Rakeiora, since it produces
vcf files in the results directory. So this workflow would probably be rejected -
it should do the actual analysis and only place the results in the results directory.
