# Create from official mysql image
FROM postgres

# Add a database
ENV POSTGRES_DB test2

# Add content of the sql-scripts directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./sql-scripts /docker-entrypoint-initdb.d/
