#!/bin/bash
set -euvx -o pipefail
shopt -s inherit_errexit

################################################################################
# Description
# ==========
# Set secret to generate one time password.
#
# Args
# ==========
# 1. APP_NAME
#    Name for calling a one-time password
#
# 2. SECRET
#    Secret string for one-time passwords issued by the application
#
################################################################################
: $1 $2

APP_NAME=$1
SECRET=$2

pushd $(dirname $0) > /dev/null
trap "popd > /dev/null" EXIT

DATA_DIR="../data"
DATA_FILE="${APP_NAME}.json"

DATA_JSON='{"secret": "'"${SECRET}"'"}'

echo "${DATA_JSON}" | jq -r . > ${DATA_DIR}/${DATA_FILE}
