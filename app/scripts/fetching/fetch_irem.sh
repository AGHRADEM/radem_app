#!/usr/bin/env sh
#
# Fetches public IREM data via HTTP.

# Build required folder structure
mkdir -p ${DATA_DIR}/irem
mkdir -p ${DATA_DIR}/irem/extracted
mkdir -p ${DATA_DIR}/irem/csv

# Create a symlink to the raw directory
DATA_RAW_DIR=${DATA_DIR}/irem/raw
if [ ! -L "$DATA_RAW_DIR" ]; then
    ABS_DATA_RAW_DIR=$(readlink -f ${DATA_RAW_DIR})
    ABS_DATA_DIR=$(readlink -f ${DATA_DIR})
    ln -s ${ABS_DATA_DIR}/irem/srem.psi.ch/datarepo/V0/irem/ ${ABS_DATA_RAW_DIR}
fi

# Get data recursively, don't download existing files
wget \
    --timestamping \
    --recursive \
    --no-parent \
    --no-verbose \
    -A gz \
    http://srem.psi.ch/datarepo/V0/irem/ \
    -P ${DATA_DIR}/irem

# Remove summary plots dir which we don't care about
rm -r ${DATA_DIR}/irem/raw/summaryplots
