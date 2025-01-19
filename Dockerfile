FROM postgres:latest

# Set environment variables
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=pass
ENV POSTGRES_DB=provaJava

# Copy the backup SQL into the container
COPY db_backup.sql /docker-entrypoint-initdb.d/

# Expose the custom PostgreSQL port
EXPOSE 5400