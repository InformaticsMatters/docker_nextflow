# Nextflow Dockerfile
Dockerfile for a Centos based container that contains Nextflow and Java.

    $ NF_VERSION=19.01.0 \
        docker build --build-arg NF_VERSION=$NF_VERSION \
        -t informaticsmatters/nextflow:$NF_VERSION .
    $ NF_VERSION=19.01.0 docker push informaticsmatters/nextflow:$NF_VERSION
    
## Runtime configuration
The container image behaviour is configured with a number of
environment variables: -

-   `NF_REPORT_OPTIONS` Reporting options with a default value
                        of default `-with-trace`
                        
-   `NF_PROFILE_NAME`   The name of the profile (defined in `nextflow-config`)
                        to execute. Docker execution would typically use the
                        default (`standard`) but OpenShift execution
                        would probably use `kubernetes`
                        
-   `NF_OPTIONS`        Additional options passed to the nextflow command-line.
                        Default is an empty string (`''`)
                        
-   `NF_INIT_SCRIPT`    The name of a pre-nextflow script to run,
                        default of `nextflow-init.sh`. The script has to be
                        injected into the work-directory of the container
                        (there isn't one by default).
                        The script is run if it is found to exist.
