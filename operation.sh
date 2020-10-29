#!/bin/bash

. ${OPERATION_FOLDER}/operation/helpers/parse_yaml.sh
cat ${OPERATION_FOLDER}/operation/misc/ui_logo.txt

BUILD=0
BUILD_ALL=0
OPERATIONS=$(find ${OPERATION_FOLDER}/operation/src -type d \
    | tail -n +2 \
    | sort \
    | rev \
    | cut -d"/" -f1 \
    | rev)

operation_get()
{
    # return value of opconfig parameter with $2 the opration and
    # $1 the name of the parameter
    eval ret=\$opconfig_${2}_${1}
    echo $ret
}

operation_get_all_symbols()
{
    for op in ${OPERATIONS}; do
        # Load yaml and create variable for each parameters
        # like opconfig_<operation>_<parameter>.
        eval $(parse_yaml ${OPERATION_FOLDER}/operation/src/${op}/config.yml "opconfig_${op}_")
        # Create other parameter opconfig_<secret>_name quals to opconfig_<operation>_name
        # used when secret is called instead of name.
        eval opconfig_$(operation_get secret ${op})_name="${op}"
    done
}

print_help()
{
    cat << EOF

usage: operation [OPTION] [OPERATION]...

Options are:
  -b, --briefing    build option (with OPERATION all, build all)
  -h, --help        display this help and exit
Without options, operation will be run.

Operations are:
EOF

    for op in ${OPERATIONS}; do
        printf " -%-12s %s\n" "${op}:" "$(operation_get description ${op})"
    done
}

process_operation()
{
    for operation in $*; do

        name=$(operation_get name ${operation})
        operation_directory=${OPERATION_FOLDER}/operation/src/${name}
        if [ ! -d "${operation_directory}" ] || [ -z ${name} ]; then
            echo "operation ${operation} not found!"
            continue
        fi

        if [ $BUILD = 1 ] || [ $BUILD_ALL = 1 ]; then
            echo "Building operation ${operation}"
            docker build -f ${operation_directory}/Dockerfile \
                -t operation_${name} \
                ${operation_directory}
        else
            echo "Running operation ${operation}"
            echo $(operation_get description ${name})
            eval $(operation_get command ${name}) ${@}
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

operation_get_all_symbols

# Parse short options
OPTIND=1
while getopts "bh" opt
do
    case "$opt" in
        "h") print_help ; exit 0 ;;
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
    echo "build all operations:" ${OPERATIONS}
    process_operation ${OPERATIONS}
else
    process_operation $*
fi
