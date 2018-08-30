#!/bin/bash

# Kill containers
docker rm -f `docker ps -a | grep ndslabs-ckan | awk '{print $1}'`

# Clean-up volumes
docker volume rm ndslabs-ckan_postgres ndslabs-ckan_redis ndslabs-ckan_solr ndslabs-ckan_ckan

# Clean-up network
docker network rm ndslabs-ckan_default
