# Snakemake_demo workflow

A simple workflow demonstrating the use of Snakemake in computational (bio)chemistry.

To get going:
```
git clone git@github.com:bernieleecy/snakemake_tutorial.git
conda install -c conda-forge mamba # if mamba is not available
mamba env create -f environment.yml
conda activate snakemake_demo
```

Using mamba is optional, i.e. `conda env create -f environment.yml` is fine, it might just be incredibly slow.

The above `environment.yml` is unlikely to work on Windows (see <https://snakemake.readthedocs.io/en/stable/getting_started/installation.html>).
Trying something like:
```
conda install -c conda-forge mamba
mamba create -c bioconda -c conda-forge -n snakemake_demo python=3.11.0 seaborn=0.12.2 snakemake-minimal
```
Might work better (but I do not have a Windows machine available to test this). 
