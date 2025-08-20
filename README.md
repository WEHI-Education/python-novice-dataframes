<a href="https://www.gnu.org/licenses/gpl-3.0"> <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" align="left" height="20"/> </a>

<a href="https://colab.research.google.com/github/WEHI-Education/python-novice-dataframes/blob/main/workshop/Pandas.ipynb"> <img src="https://colab.research.google.com/assets/colab-badge.svg" align="right" height="20"/> </a>

<br>

# Working locally

## On Mac or Linux machine

1.  Install a conda based package manager. We recommend **Miniforge3** if you are setting up for the first time.
    -   [miniforge3](https://conda-forge.org/miniforge/)
    -   [micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)
2.  [Install VS Code](https://code.visualstudio.com/download) or [Positron](https://positron.posit.co/download.html).


Clone this repo and navigate into the dir:

``` bash
git clone https://github.com/Adamtaranto/python-novice-dataframes.git && cd python-novice-dataframes
```

Set up a python environment with the packages we will be using:

### Using Conda

``` bash
# Create env and install packages from yml
conda env create --name pandas-workshop --file environment.yml

# Activate the environment
conda activate pandas-workshop
```

Note: If you are using micromamba just replace `conda` with `micromamba` in the commands.

### Or using pip

``` bash
pip install matplotlib numpy pandas scipy seaborn jupyterlab ipykernel
```

Now you can open the notebook `workshop/Pandas.ipynb` in VS Code or in Jupyter Lab.

``` bash
# Launch Jupyter lab
jupyter lab
```

## Setup for Windows

1.  [Install GitBash](https://wehi-education.github.io/git-novice/#installing-git)
2.  [Install VS Code](https://code.visualstudio.com/download) or [Positron](https://positron.posit.co/download.html). If you are on a windows machine you will also need to [set your default shell as "GitBash"](https://code.visualstudio.com/docs/sourcecontrol/intro-to-git#_git-bash-on-windows).
3.  Install [miniforge3](https://conda-forge.org/miniforge/)
4.  Open a GitBash shell and run this command to enable Conda: `~/miniforge3/Scripts/conda.exe init bash`
5.  From a *new* GitBash shell clone this repo and navigate into the dir:

``` bash
git clone https://github.com/Adamtaranto/python-novice-dataframes.git && cd python-novice-dataframes
```

6.  Use conda to install create a new env with our packages. `conda env create --name pandas-workshop --file environment.yml`

7.  Activate the environment. `conda activate pandas-workshop`

8.  Launch Jupyter Lab. `jupyter lab`

# Working on WEHI Ondemand

You can launch a in interactive Jupyter Lab session on the WEHI HPC (Milton) via Ondemand.

You must have a Milton HPC account and a VAST scratch workspace set up before using this option. [Request access here](https://support.wehi.edu.au/support/catalog/items/134).

## Step 1: Setup Micromamba to manage environments

-   Sign in to WEHI [Ondemand](https://ondemand.hpc.wehi.edu.au/)
-   From `Clusters` select `>_Slurm WEHI Shell Access`

``` bash
# Load micromamba
module load micromamba/latest

# Set up channels
micromamba config prepend channels conda-forge
micromamba config prepend channels bioconda

# Store environments and downloaded packages in your SCRATCH directory
micromamba config append pkgs_dirs /vast/scratch/users/$USER/condapkgs
micromamba config append envs_dirs /vast/scratch/users/$USER/condaenvs

# Format the environment prompt
micromamba config set env_prompt "({name}) "

# Add micromamba to your .bashrc so it is activated for new shell sessions
micromamba shell init --shell bash --root-prefix=~/micromamba

# Verify config settings are correct
micromamba config list
```

For more information on working with conda/micromamba on Milton see our [sharepoint page](https://wehieduau.sharepoint.com/sites/rc2/SitePages/Conda-on-Milton.aspx?web=1)

## Step 2: Clone this repository onto Milton and create env

-   Sign in to WEHI [Ondemand](https://ondemand.hpc.wehi.edu.au/)
-   From `Clusters` select `>_Slurm WEHI Shell Access`

``` bash
# Load Git
module load git

# Navigate to your SCRATCH dir and clone this repository
cd /vast/scratch/users/$USER
git clone https://github.com/WEHI-Education/python-novice-dataframes.git && cd python-novice-dataframes

# Create a new environment using the `environment.yml` file in this repo
micromamba env create -f environment.yml

# Clean up package tarballs
micromamba clean --all
```

Finally, we need to create a new ipykernel that uses our environment

``` bash
# Check that you can activate the env
micromamba activate pandas-workshop

# Create the ipykernel
python -m ipykernel install --user --name pandas-workshop --display-name "Python (pandas-workshop)"
```

## Step 3: Launch Jupyter via Ondemand

-   Sign in to WEHI [Ondemand](https://ondemand.hpc.wehi.edu.au/)
-   From `Apps` select `Jupyter`

Launch an interactive Jupyter notebook session using these settings

-   Partition: `regular`
-   Notebook Path: `/vast/scratch/users/$USER/python-novice-dataframes/workshop/Pandas.ipynb`
-   Extra Jupyter arguments: `--notebook-dir=/vast/scratch/users/$USER`
-   Runtime hours: 6

Open the Jupyter session.

For more information on using conda/micromamba environments with Jupyter on Milton [see our sharepoint page](https://wehieduau.sharepoint.com/sites/rc2/SitePages/Jupyter-Open-OnDemand.aspx).