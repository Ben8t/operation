#!/bin/bash

cat ${OPERATION_FOLDER}/operation/misc/ui_logo.txt

# HELP
if [ "$1" = "--help" ]; then
   cat ${OPERATION_FOLDER}/operation/misc/help.txt
fi

# BUILD
if [ "$1" = "briefing" ]; then
   docker build -f ${OPERATION_FOLDER}/operation/src/test/Dockerfile -t operation_test . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/csv/Dockerfile -t operation_csv . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/python/Dockerfile -t operation_python . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/rstudio/Dockerfile -t operation_rstudio . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/search/Dockerfile -t operation_search . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/date/Dockerfile -t operation_date . && \
   docker build -f ${OPERATION_FOLDER}/operation/src/image/Dockerfile -t operation_image .
fi

# TEST
if [ "$1" = "test" ]; then
   docker container run --rm operation_test
fi

# CSV
if [[ "$1" = "csv-split" && ! -z "$2" && ! -z "$3" ]]; then
   docker container run --rm -v $(pwd):/tmp operation_csv split.sh /tmp/$2 $3
fi

# PYTHON
if [ "$1" = "pybash" ]; then
   docker container run --rm -it -v $(pwd):/tmp operation_python
fi

if [ "$1" = "ipython" ]; then
   docker container run --rm -it -v $(pwd):/tmp --entrypoint ipython operation_python
fi

if [ "$1" = "jupyter-notebook" ]; then
   docker container run --rm -p 8888:8888 -v $(pwd):/tmp --entrypoint jupyter-notebook operation_python --notebook-dir=/tmp --ip='*' --port=8888 --no-browser --allow-root
fi

# RSTUDIO
if [ "$1" = "rstudio" ]; then
   echo "Open a web browser to 0.0.0.0:8787 - user = user and password = root."
   docker container run --rm -v $(pwd):/home/rstudio/kitematic -p 8787:8787 -e USER=user -e PASSWORD=root operation_rstudio
fi

# SEARCH
if [ "$1" = "search" ]; then
   docker container run --rm -it operation_search "${@:2}"
fi

# SHUTDOWN
if [ "$1" = "shutdown" ]; then
   docker rm -f $(docker ps -a -q)
fi

if [ "$1" = "date" ]; then
   docker container run --rm -it operation_date "${@:2}"
fi

if [ "$1" = "image" ]; then
   docker container run --rm -it -v $(pwd):/app operation_image "${@:2}"
fi