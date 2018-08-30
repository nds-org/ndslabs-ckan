# CKAN 2.5

Resources to deploy CKAN in [Labs Workbench](https://github.com/nds-org/ndslabs).

This is a minor modification of the official CKAN Dockerfile to allow overriding Solr and Postgres environment variables.

# Usage
With Docker Compose:
```bash
docker-compose up -d
```

With Raw Docker:
```bash
# Run PostgreSQL
docker run -itd --name=db -p 5432:5432 --env-file=./postgres.env -v $(pwd)/postgres-data:/var/lib/postgresql/data postgres:9.3

# Run Redis
docker run -itd --name=redis -p 6379:6379 -v $(pwd)/redis-data:/data redis:3.0

# Run Solr
docker run -itd --name=solr --link db:db --link redis:redis -p 8983:8983 --env-file=./solr.env -v $(pwd)/solr-data:/opt/solr/server/solr/ckan/data ckan/solr:release-v2.5.3

# Run CKAN
docker run -itd --name=ckan --link solr:solr --link db:db --link redis:redis -p 5000:5000 --env-file=./ckan.env -v $(pwd)/ckan-data:/var/lib/ckan ndslabs/ckan
```

## See also
* https://github.com/nds-org/ndslabs
* https://github.com/nds-org/ndslabs-specs
