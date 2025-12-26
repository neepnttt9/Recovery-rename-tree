#!/bin/bash
# extract_utils.sh - Standard Android helper

function get_make_variable() {
    local name="$1"
    local value=$(grep "^${name} :=" "${MY_DIR}/../Android.mk" | cut -d= -f2- | sed 's/ //g')
    echo "${value}"
}

echo "Using basic extract mode for m14x"
