<div align="center">
<img src="operation/misc/operation.png" width="400" />
</div>

# Operation

`operation` is a tool that gather many Docker routines into one place to bring common and simple environments or applications. It is pretty similar to [docker-compose](https://github.com/docker/compose) features but with defined Docker images, and a focus on data science tools.

This project was born from several observations :

* It is sometimes difficult to install (and reinstall) tools on your computers.

* It is boring to gather utils applications we don't really know and use occasionally (like split a csv file, reverse an image, etc...).

* It is hard to custom and install other tools without worring about installation dependencies on your system.

`operation` bring simple pattern as `operation <operation_name>` to run any operation listed below. The name operation come from military operations which are defined, operate and then classified : like any Docker container.
It is recommanded to know a bit of this technology to better understand and customize your own operations.

> Goal here is not to replace a full workspace but rather to give easy applications without any setup required, excepted Docker.

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

### rstudio

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


## Advanced

It's pretty easy to custom any Dockerfile in this repository and add any operations needed. The folder `operation/src` contains all operations which are defined by a `Dockerfile` and a `config.yml`.

## Artwork

Learning to use Blender during the development of this project so...

<div align="center">
<img src="operation/misc/artwork.png" width="800" />
</div>

---

Copyright © 2020 Benoit Pimpaud

This project is licensed under the MIT license
