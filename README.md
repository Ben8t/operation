<center>
<img src="operation/misc/operation.png" width="400" />
</center>

# Operation

`operation` is a tool that gather many Docker images into one place to bring common and simple environments. With a focus on data science projects you will find Python or R workspaces such as Jupyter-Notebook or Rstudio.

This project was born from several observations :

* It is sometimes difficult and boring to install (and reinstall) tools on your computers.

* It is boring to gather utils applications we don't really know and use occasionally (like split a csv file, reverse an image, etc...).

* It is hard to custom and install other tools without worring about installation dependencies on your system.

`operation` bring simple pattern as `operation <operation_name>` to run any operation listed below. 

## Getting started

While it is build with *bash* the only dependency you will need is [Docker](https://docs.docker.com/install/). Then you can clone this repository and add shortcuts in your terminal :

1. `git clone https://gitlab.com/ben8t/operation.git`

2. Add the following lines to your `.bashrc` script.

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

Where `<installation_path>` is the full path where you cloned this repository.

3. Run `operation briefing`. It may take a little time while it is building all Docker images. (improve coming soon...).

4. Run `operation test` to test the installation. This routine should print "Roger that." in your console.

## :round_pushpin: Operations list

### python

`operation pybash`

`operation ipython`

`operation jupyter-notebook`

## rstudio

`operation rstudio`

### csv

`operation csv-split <file> <chunk_size>`

### search

`operation search <query>`

### shutdown

`operation shutdown`

### date

`operation date`

### image

`operation image`

## Artwork

<center>
<img src="operation/misc/artwork.png" width="800" />
</center>

---

This project is licensed under the MIT license
