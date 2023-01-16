rule clean_protein_rmsd:
    input:
        "runs/{folder}/{i}-backbone_rmsd_dirty.xvg",
    output:
        "results/{folder}/protein/data/{i}-backbone_rmsd.xvg",
    shell:
        "awk 'NR>1' {input} > {output}"


rule plot_protein_rmsd_single:
    input:
        rules.clean_protein_rmsd.output,
    output:
        "results/{folder}/protein/{i}-backbone_rmsd.png",
    params:
        ylabel="RMSD (Å)",
        time_unit="ns",
        ymax=6,
    script:
        "../scripts/plot_time_series_single.py"


def get_rmsd_xvgs(wildcards):
    return [
        os.path.join(
            "results", wildcards.folder, "protein/data", run + "-backbone_rmsd.xvg"
        )
        for run in IDS
    ]


rule plot_protein_rmsd_all:
    """
    Specify time units (usually ns)
    """
    input:
        get_rmsd_xvgs,
    output:
        "results/{folder}/protein/backbone_rmsd_all.png",
    params:
        ylabel="RMSD (Å)",
        time_unit="ns",
        ymax=6,
    script:
        "../scripts/plot_time_series_multi.py"
