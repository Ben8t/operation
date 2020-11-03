#!/bin/bash

. ${OPERATION_FOLDER}/operation/helpers/parse_yaml.sh

cat ${OPERATION_FOLDER}/operation/misc/ui_logo.txt

if [ -z "$1" ]; then
    echo "Please pass a command."
fi

# HELP
if [ "$1" = "--help" ]; then
   cat ${OPERATION_FOLDER}/operation/misc/help.txt
fi


for operation_directory in $(ls ${OPERATION_FOLDER}/operation/src)
do
    eval $(parse_yaml ${OPERATION_FOLDER}/operation/src/$operation_directory/config.yml "opconfig_")
    # BUILD
    if [ "$1" = "briefing" ]; then
        if [[ "$2" = $opconfig_name ]]; then
            echo "Building operation $opconfig_name"
            DOCKER_BUILDKIT=1 docker build --ssh github_ssh_key=/Users/$USER/.ssh/id_rsa -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile -t operation_$opconfig_name ${OPERATION_FOLDER}/operation/src/$operation_directory/.
        fi
        if [[ -z "$2" && -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile ]]; then
            echo "Building operation $opconfig_name"
            DOCKER_BUILDKIT=1 docker build --ssh github_ssh_key=/Users/$USER/.ssh/id_rsa -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile -t operation_$opconfig_name ${OPERATION_FOLDER}/operation/src/$operation_directory/.
        fi
    # RUN
    elif [[ "$1" = "$opconfig_name" || "$1" = "$opconfig_secret" ]]; then
        echo $opconfig_description
        $opconfig_command
    fi
done

