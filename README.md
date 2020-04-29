<div align="center">
<img src="operation/misc/operation.png" width="400" />
</div>

# Operation

`operation` gathers many Docker routines into one place to bring common and simple environments or applications.

From a data science view,  this project was born from several observations :

* It is sometimes difficult to install (and reinstall) tools on your computers.

* It is boring to gather utils we don't really know and we use only occasionally (like split a csv file, reverse an image, etc...).

* It is hard to custom and install other tools without worrying about installation dependencies on your system.

While Docker answers these problems, it still tedious to find, build, historize docker images. Keeping reproducibility in mind.

`operation` brings simple pattern as `operation <operation_name>` to run any operation listed below. 

The name "operation" comes from military operations that are defined, operated and then classified : like any Docker container.
It is recommended to know a bit of this technology to better understand and customize your own operations.

> It is pretty like [docker-compose](https://github.com/docker/compose) features but with defined Docker images, and a focus on data science tools. Goal here is not to replace a full workspace but rather to round up common applications with very light setup required : it is bash + docker only.

## Getting started

While it is build with *bash* the only dependency you will need is [Docker](https://docs.docker.com/install/). 

Then you can clone this repository and add shortcuts in your terminal :

1. `git clone https://gitlab.com/ben8t/operation.git`

2. Add the following lines to your shell session script (`.bashrc` or `.zshrc` or `config.fish`, etc...).

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

`<installation_path>` is the full path where you cloned this repository.

> Tips : you can change the alias by "ops" for your lazy fingers...

3. Run `operation briefing`. It may take a little time while it is building all Docker images.

> TODO : use field type in operation configuration files (`config.yml`) to separate builds.

4. Run `operation test` to test the installation. This routine should print "Roger that." in your console.

## :round_pushpin: Operations list

### python

`operation pybash` or `operation underground`

`operation ipython` or `operation rattlesnake`

`operation jupyter` or `operation neptune`

### rstudio

`operation rstudio` or `operation paramount`

### csv

`operation csv-split <file> <chunk_size>`

### search

`operation search <query>` or `operation mirador`

### shutdown

`operation shutdown`

### date

`operation date` or `operation chronos`

### image

`operation image` or `operation nightbird`

### mlflow

`operation mlflow` or `operation blue_flower`

### shellcheck

`operation shellcheck` or `operation white_paper`

## Advanced

It's pretty easy to custom any Dockerfile in this repository and add any operations needed. The folder `operation/src` contains all operations which are defined by a `Dockerfile` and a `config.yml`.

## Artwork

Learning to use Blender during the development of this project so. [More artworks on Behance](https://www.behance.net/gallery/95156933/Operation).

<div align="center">
<img src="operation/misc/artwork.png" width="800" />
</div>

---

Copyright © 2020 Benoit Pimpaud

This project is licensed under the MIT license
