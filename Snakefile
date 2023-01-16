# A basic Snakefile
configfile: "config/config.yaml"


rule clean_data:
    input:
        "sample/data/{i}-backbone_rmsd_dirty.xvg",
    output:
        "sample/results/{i}-backbone_rmsd.xvg",
    shell:
        "awk 'NR>1' {input} > {output}"


rule plot_data:
    input:
        "sample/results/{i}-backbone_rmsd.xvg",
    output:
        "sample/results/{i}-backbone_rmsd.png",
    script:
        "workflow/scripts/plot_time_series_single.py"
