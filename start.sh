#!/bin/bash

NF_WORKFLOW=main.nf
NF_REPORT='-with-trace results/trace.txt'
NF_OPTS='-with-docker centos:7'
NF_INIT=${NF_INIT_SCRIPT:-$HOME/nextflow-init.sh}

echo "Looking for init script $NF_INIT"
if [ -f $NF_INIT ]; then
    echo "Executing init script"
    source $NF_INIT
fi

echo "Running Nextflow"
nextflow run $NF_WORKFLOW $NF_OPTS $NF_REPORT
echo 'Nextflow completed'

echo "Moving results..."
mv results/* .
rm -rf results
echo "Results moved"
