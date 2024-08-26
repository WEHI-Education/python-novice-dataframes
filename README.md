<a href="https://www.gnu.org/licenses/gpl-3.0">
  <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" align="left" height="20"/>
</a> 

<a href="https://gitpod.io/#https://github.com/Adamtaranto/python-novice-dataframes">
  <img src="https://gitpod.io/button/open-in-gitpod.svg" align="right" height="35"/>
</a>

<br>


# Working in Gitpod

Click the Gitpod button at the top of this README to launch a gitpod workspace with all the required software pre-installed. 

If you have a paid Gitpod account you can increase the timout limit on your workspace. 
Otherwise you will need to restart the workspace periodically.

```bash
# Increase gitpod timeout setting
gp timeout set 6h
```

Manually start Jupyter session

```bash
# Launch jupyter-lab
jupyter lab --NotebookApp.allow_origin='*' --NotebookApp.allow_remote_access=True --NotebookApp.token='' --NotebookApp.password='' --no-browser --port=8888
```

**Note:** See other [gitpod settings](https://www.gitpod.io/docs/references/gitpod-cli#set) here.
