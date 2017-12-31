# docker-compose.yml for Grafana and InfluxDB

Install a Docker-based Grafana+InfluxDB dashboarding solution in minutes.
The docker-compose.yml file houses the main configuration. For details on docker-compose, see https://docs.docker.com/compose/

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
This script errors out, unless you wait 30 seconds are so after running the up.sh script.

The timeshift proxy provides other syntax enhancements (like math functions) that are not currently available in influxdb.
For details, see https://github.com/maxsivanov/influxdb-timeshift-proxy.
