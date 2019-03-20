#!/bin/bash

NF_WORKFLOW=main.nf
NF_REPORT=${NF_REPORT_OPTIONS:-'-with-trace'}
NF_OPTS=${NF_OPTIONS:-''}
NF_INIT=${NF_INIT_SCRIPT:-$HOME/nextflow-init.sh}
NF_PROFILE=${NF_PROFILE_NAME:-standard}

echo "Looking for init script $NF_INIT"
if [ -f $NF_INIT ]; then
    echo "Executing init script"
    source $NF_INIT
else
    echo "No init script found"
fi

echo "Running Nextflow"
nextflow run $NF_WORKFLOW -profile $NF_PROFILE $NF_OPTS $NF_REPORT
echo "Nextflow completed (ExitCode=$?)"

# Optionally move results
if [ -d "results" ]; then
    echo "Moving results..."
    mv results/* .
    rm -rf results
    echo "Results moved"
else
    echo "No results directory"
fi
