rule clean_peptide_rmsd:
    input:
        "runs/{folder}/{i}-pep_backbone_rmsd_dirty.xvg",
    output:
        "results/{folder}/peptide/data/{i}-pep_backbone_rmsd.xvg",
    shell:
        "awk 'NR>1' {input} > {output}"


rule plot_peptide_rmsd_single:
    input:
        rules.clean_peptide_rmsd.output,
    output:
        "results/{folder}/peptide/{i}-peptide_backbone_rmsd.png",
    params:
        ylabel="RMSD (Å)",
        time_unit="ns",
        ymax=10,
    script:
        "../scripts/plot_time_series_single.py"


def get_pep_rmsd_xvgs(wildcards):
    return [
        os.path.join(
            "results", wildcards.folder, "peptide/data", run + "-pep_backbone_rmsd.xvg"
        )
        for run in IDS
    ]


rule plot_pep_rmsd_all:
    """
    Specify time units (usually ns)
    """
    input:
        get_pep_rmsd_xvgs,
    output:
        "results/{folder}/peptide/peptide_backbone_rmsd_all.png",
    params:
        ylabel="RMSD (Å)",
        time_unit="ns",
        ymax=10,
    script:
        "../scripts/plot_time_series_multi.py"
