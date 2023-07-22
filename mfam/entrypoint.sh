#!/bin/bash
set -euvx -o pipefail
shopt -s inherit_errexit

################################################################################
# Description
# ==========
# Entrypoint of this app.
#
# Args
# ==========
# 1. COMMAND
#    Entered command name.
#
# 2. Args
#    Entered arguments.
#
################################################################################
: $1 

COMMAND=$1
ARGS=${@:2}

pushd $(dirname $0) > /dev/null
trap "popd > /dev/null" EXIT

./commands/${COMMAND}.sh ${ARGS}
