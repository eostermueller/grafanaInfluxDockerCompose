# docker-compose.yml for Grafana and InfluxDB

Install a Docker-based Grafana+InfluxDB dashboarding solution in minutes.

Features:
 - Drop your .js [Grafana scripted dashboard](http://docs.grafana.org/reference/scripting/) into the 'dashboards' folder.
 - Backup all your influxdb data from a single exposed folder (influxDbData).
 - Includes a conatiner to use jmxtrans.org to push Java JMX data to influxdb.  Currently commented out in docker-compose.yml.
 - Add enhanced influxdb SQL syntax to your dashboards using [the timeshift proxy](https://github.com/maxsivanov/influxdb-timeshift-proxy).  Provides math and timeshift syntax not currently available in influxdb.

The docker-compose.yml file houses the main configuration. For details on docker-compose, see https://docs.docker.com/compose/

Large portions of this were shamelessly stolen from [here](https://github.com/jekkos/grafana-influx-jmxtrans) and [here](https://github.com/nicolargo/docker-influxdb-grafana).

## Install and Startup
 1. Install docker:  https://docs.docker.com/engine/installation/
 2. Clone this repo:  git clone https://github.com/eostermueller/grafanaInfluxDockerCompose.git
 3. Run the up.sh script to startup the influxdb and grafana containers.
 4. To log into Grafana, open browser to http://localhost:3000 .  Login with admin/admin.
 4. Run the down.sh script to shut down all containers.

## Configuration
 - All data files for the influxdb repository are created in the influxDbData folder....helpful for backup/restore.
 - Grafana scripted dashboard .js files should go in the grafanaPublicDashboards folder.  Details on scripted dashboards:  http://docs.grafana.org/reference/scripting/

## Timeshift

This docker-compose also launches a tiny container that enables you to add 'enhanced' syntax to the influx SQL that you embed in your Grafana dashboards.

This architecture makes it happen:

    Grafana Dashboard --> influxTimeShift Datasource --> timeshift-proxy (port 8089) --> InfluxDB (port 8086)

To add the influxTimeShift Datasource (above), just run the addGrafanaTimeShiftDataSource.sh script.
This script errors out(curl: (52) Empty reply from server), unless you wait 30 seconds are so after running the up.sh script.

The timeshift proxy provides other syntax enhancements (like math functions) that are not currently available in influxdb.
For details, see https://github.com/maxsivanov/influxdb-timeshift-proxy.

## Resources

Execute InfluxDB queries like this:
    curl 'http://localhost:8086/query?pretty=true' --data-urlencode "db=jmeter" --data-urlencode "q=SHOW MEASUREMENTS"


...where the guid looking thing is the "CONTAINER ID" from a "docker ps -s" command while the up.sh is running.

Test whether the containers are running.  Execute this command:
    docker ps -s

...and it shows one line for each container:

    CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS
    3acb00c43d15        thedrhax/influxdb-timeshift-proxy:1.0   "/bin/sh -c 'npm r..."   38 minutes ago      Up 38 minutes       0.0.0.0:8089->8089/tcp
    61705467ed5d        grafana/grafana:4.2.0                   "/run.sh"                38 minutes ago      Up 38 minutes       0.0.0.0:3000->3000/tcp
    582cbde4d7b5        influxdb:1.4.2                          "/entrypoint.sh in..."   38 minutes ago      Up 38 minutes       0.0.0.0:8083->8083/tcp, 0.0.0.0:8086->8086/tcp, 0.0.0.0:8090->8090~


Open a bash shell into one of the containers (influx, grafana, jmxtrans, timeshift proxy) using this command:
    docker exec -it 61705467ed5d bash

...and note that the 61705467ed5d came from the "CONTAINER ID" column for the grafana container from the "docker ps -s" command above.

