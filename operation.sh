#!/bin/bash

. ${OPERATION_FOLDER}/operation/helpers/parse_yaml.sh

BUILD=0
BUILD_ALL=0
operations=$(find ${OPERATION_FOLDER}/operation/src -type d \
    | tail -n +2 \
    | sort \
    | rev \
    | cut -d"/" -f1 \
    | rev)

cat ${OPERATION_FOLDER}/operation/misc/ui_logo.txt

process_operation()
{
    for operation in $*; do

        operation_directory=${OPERATION_FOLDER}/operation/src/${operation}
        if [ ! -d "${operation_directory}" ]; then
            echo "operation ${operation} not found!"
            continue
        fi

        eval $(parse_yaml ${operation_directory}/config.yml "opconfig_")

        if [ $BUILD = 1 ] || [ $BUILD_ALL = 1 ]; then
            echo "Building operation $opconfig_name"
            docker build -f ${operation_directory}/Dockerfile \
                -t operation_$opconfig_name \
                ${operation_directory}
        else
            echo "Running operation $opconfig_name"
            echo $opconfig_description
            $opconfig_command
            break
        fi
    done
}

# Transform long options to short ones
for arg in "$@"; do
    shift
    case "$arg" in
        "--help")       set -- "$@" "-h" ;;
        "--briefing")   set -- "$@" "-b" ;;
        *)              set -- "$@" "$arg"
    esac
done

# Parse short options
OPTIND=1
while getopts "bh" opt
do
    case "$opt" in
        "h") cat ${OPERATION_FOLDER}/operation/misc/help.txt; exit 0;;
        "b") BUILD=1 ;;
        "?") exit 1 ;;
    esac
done
shift $(($OPTIND - 1))

if [ -z "$1" ]; then
    echo "Please pass a command."
fi

if [ "$1" == "all" ] && [ $BUILD = 1 ]; then
    BUILD_ALL=1
    echo "build all operations:" $operations
else
    operations=$*
fi

process_operation ${operations}
