#!/bin/bash

. ${OPERATION_FOLDER}/operation/helpers/parse_yaml.sh

cat ${OPERATION_FOLDER}/operation/misc/ui_logo.txt

# Transform long options to short ones
for arg in "$@"; do
    shift
    case "$arg" in
        "--help") set -- "$@" "-h" ;;
        *)        set -- "$@" "$arg"
    esac
done

# Parse short options
OPTIND=1
while getopts "h" opt
do
    case "$opt" in
        "h") cat ${OPERATION_FOLDER}/operation/misc/help.txt; exit 0;;
        "?") exit 1 ;;
    esac
done
shift $(($OPTIND - 1))

if [ -z "$1" ]; then
    echo "Please pass a command."
fi

for operation_directory in $(ls ${OPERATION_FOLDER}/operation/src)
do
    eval $(parse_yaml ${OPERATION_FOLDER}/operation/src/$operation_directory/config.yml "opconfig_")
    # BUILD
    if [ "$1" = "briefing" ]; then
        if [[ "$2" = $opconfig_name ]]; then
            echo "Building operation $opconfig_name"
            docker build -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile -t operation_$opconfig_name ${OPERATION_FOLDER}/operation/src/$operation_directory/.
        fi
        if [[ -z "$2" && -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile ]]; then
            echo "Building operation $opconfig_name"
            docker build -f ${OPERATION_FOLDER}/operation/src/$operation_directory/Dockerfile -t operation_$opconfig_name ${OPERATION_FOLDER}/operation/src/$operation_directory/.
        fi
    # RUN
    elif [[ "$1" = "$opconfig_name" || "$1" = "$opconfig_secret" ]]; then
        echo $opconfig_description
        $opconfig_command
    fi
done

