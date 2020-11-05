
# Operations List

## Python

`operation pybash` or `operation underground`: access a bash environment with python installed. Current workspace is mapped to `/tmp` folder in container.

`operation ipython` or `operation rattlesnake`: launch an [IPython](https://ipython.org/) shell.

`operation jupyter` or `operation neptune`: launch a [Jupyter Notebook](https://jupyter.org/).

## RStudio

`operation rstudio` or `operation paramount`: launch a [RStudio](https://rstudio.com/) session.

## CSV processing

`operation csv-split <file> <chunk_size>`: allow to split a csv file into many parts.

## DuckDuck Go search

`operation search <query>` or `operation mirador`: query to DuckDuckGo engine.

## Shutdown (kill)

`operation shutdown`: clear all operations. 

> WARNING : this will stop/delete all running Docker container too.

## Date processing

`operation date` or `operation chronos`: a tiny command line utility to calculate date and time difference. 

Based on [pdd](https://github.com/jarun/pdd).

## Image processing

`operation image` or `operation nightbird`: a command line image resizer and rotator for JPEG and PNG images. 

Based on [imgp](https://github.com/jarun/imgp).

## MLflow

`operation mlflow` or `operation blue_flower`: launch [MLFlow](https://mlflow.org/) user interface from the current folder (must contains a mlruns folder).

## Shellcheck

`operation shellcheck` or `operation white_paper`: check shell script syntax. 

Based on [shellcheck](https://github.com/koalaman/shellcheck).

## Report (list)

`operation report`: list all running operation.
