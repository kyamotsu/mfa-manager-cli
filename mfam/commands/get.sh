#!/bin/bash
set -euvx -o pipefail
shopt -s inherit_errexit

################################################################################
# Description
# ==========
# Get one time password.
#
# Args
# ==========
# 1. APP_NAME
#    Name for calling a one-time password
#
################################################################################
: $1

APP_NAME=$1

pushd $(dirname $0) > /dev/null
trap "popd > /dev/null" EXIT

SECRET=$(cat ../data/${APP_NAME}.json | jq -r .secret)

oathtool --base32 --totp "${SECRET}"
