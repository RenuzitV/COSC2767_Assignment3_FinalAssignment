Paste `userdata.sh` into your shell, or setup as user data on any EC2 instance.
This script is set to run on the `us-east-1` region. Adjust them as needed.
The script then goes into `BASIC-REQUIREMENTS` and deploys the following services:

<li> Jenkins </li>
<li> Prometheus </li>
<li> Grafana </li>

<h1> Jenkins </h1>
`Jenkins` is configured as a pipeline in the `Jobs` folder, which contains the pipeline:

`Build Image` -> `Deploy to Dev environment` -> `Integration test` -> `Deploy to Prod environment`

The pipeline tests the connection between two services: a `MariaDB` database connection to a `PHP` website hosted with `Apache`. 

<a href="https://github.com/RenuzitV/COSC2767_RMIT_Store_DB">Database repository</a>

<a href="https://github.com/RenuzitV/COSC2767-RMIT-Store">Website repository</a>
