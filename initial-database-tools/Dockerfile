FROM postgres

ENV POSTGRES_DB store

COPY store-initial-sql.sql /docker-entrypoint-initdb.d/
