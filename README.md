![logo](operation/misc/operation.png)

# Operation

`operation` is a tool that gather many Docker images into one place to bring common and simple environments. With a focus on data science projects you will find Python or R workspaces such as Jupyter-Notebook or Rstudio.

This project was born from several observations :

* It is sometimes difficult and boring to install (and reinstall) tools on your computers.

* To get utils applications we don't really know and use occasionally (like split a csv file, reverse an image, etc...).

* To be able to custom these tools without worring about installation dependencies on your system.

`operation` bring simple pattern as `operation <operation_name>` to run any operation listed below. 

## Getting started

While it is build with *bash* the only dependency you will need is [Docker](https://docs.docker.com/install/). Then you can clone this repository and add shortcuts in your terminal :

1. `git clone https://gitlab.com/ben8t/operation.git`

2. [OPTIONAL] Add the following lines to your `.bashrc` script.

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

Where `<installation_path>` is the full path where you cloned this repository.

3. Run `operation briefing`. It may take a little time while it is building all Docker images. (improve coming soon...).

4. Run `operation test` to test the installation. This routine should print "Roger that." in your console.

## :round_pushpin: Operations list

### Python

**bash** : `operation pybash`

**ipython** : `operation ipython`

**jupyter-notebook** : `operation jupyter-notebook`

## Rstudio

**rstudio** : `operation rstudio`

### CSV

**split** : `operation csv-split <file> <chunk_size>`

### SEARCH

**search** : `operation search <query>`

---

This project is licensed under the MIT license
