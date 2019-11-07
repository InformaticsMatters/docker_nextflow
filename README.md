# Nextflow
A container image for a Centos based container that contains [Nextflow]
and Java.

You can use Docker's build-args to build the image for a specific nextflow
release: -

    $ V=19.10.0
    $ docker build --build-arg NF_VERSION=$V -t informaticsmatters/nextflow:$V .
    $ docker push informaticsmatters/nextflow:$V
    
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

---

[nextflow]: https://www.nextflow.io
