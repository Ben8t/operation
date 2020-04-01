![logo](operation/misc/operation.png)

# Operation

Operation is a tool that gather many Docker images into one place to bring common and simple environments. With a focus on data science projects you will find Python or R workspaces such as jupyter-notebook or Rstudio.

## Getting started

**Prerequisite** : [Docker installed](https://docs.docker.com/install/).

1. `git clone https://gitlab.com/ben8t/operation.git`

2. Add the following lines to your `.bashrc` script.

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

Where `<installation_path>` is the full path where you cloned this repository.

3. Run `operation briefing`. It may take a little time (improve coming soon...).

4. Run `operation test` to test the installation. This routine should print "Roger that." in your console.

## :closed_book: Operations list

### Python

**bash** : `operation pybash`

**ipython** : `operation ipython`

**jupyter-notebook** : `operation jupyter-notebook`

## Rstudio

**rstudio** : `operation rstudio`

### CSV

**split** : `operation csv-split <file> <chunk_size>`

---

This project is licensed under the MIT license
