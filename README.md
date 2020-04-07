<div align="center">
<img src="operation/misc/operation.png" width="400" />
</div>

# Operation

`operation` is a tool that gather many Docker images into one place to bring common and simple environments. It is pretty similar to [docker-compose](https://github.com/docker/compose) features but with defined Docker images, focusing on data science applications.

This project was born from several observations :

* It is sometimes difficult to install (and reinstall) tools on your computers.

* It is boring to gather utils applications we don't really know and use occasionally (like split a csv file, reverse an image, etc...).

* It is hard to custom and install other tools without worring about installation dependencies on your system.

`operation` bring simple pattern as `operation <operation_name>` to run any operation listed below. The name operation come from military operations which are defined, operate and then classified : like any Docker container.
It is recommanded to know a bit of this technology to better understand and customize your own operations.

## Getting started

While it is build with *bash* the only dependency you will need is [Docker](https://docs.docker.com/install/). 

Then you can clone this repository and add shortcuts in your terminal :

1. `git clone https://gitlab.com/ben8t/operation.git`

2. Add the following lines to your `.bashrc` script.

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

> Tips : you can change the alias by "ops" for your lazy fingers...

`<installation_path>` is the full path where you cloned this repository.

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

<div align="center">
<img src="operation/misc/artwork.png" width="800" />
</div>

---

Copyright © 2020 Benoit Pimpaud

This project is licensed under the MIT license
