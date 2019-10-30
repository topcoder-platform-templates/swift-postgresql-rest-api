# Topcoder Starter Packs - Swift/Perfect and MySQL API

## Deployment dependencies

Before performing a Deployment, it's assumed that the following have been set up:

- OS X 10.13.6+
- Swift 4.2.1 (Perfect framework supports this version)
- Docker

## Organization of the submission
- `server`- the directory with sample server written in Swift (with Perfect framework)
- `postgres` - the directory with Dockerfile used to create PostgreSQL image
- `docs` - this directory contains the documentation, including this deployment guide

## 3rd party libraries

- Perfect and its subframeworks
- SwiftyJSON

## Configuration

The server can be configured using environment variables or right in `server/SampleServer/Sources/SampleServer/Configuration.swift`:
The environment variables should be provided in `docker-comppose.yml`:
- `DATABASE_NAME` - the database name. Check that content of `mysql/Docker` and make sure the database name is the same;
- `DATABASE_HOST` - the host where PostgreSQL is installed. It should be the name of the corresponding container if launched in a "docker network";
- `DATABASE_USERNAME` - database username used to connect;
- `DATABASE_PASSWORD` - database password used to connect.

## Launch the database and sample server
```
docker-compose up --build
```

## Debug and test server and PostgreSQL separately 

Follow README.md files in `server/` and `postgres/` directories for more information.

## Verification

1. Launch the containers using `docker-compose up --build` command as mentioned above
2. Use Postman sample requests provided in `docs/postman` to verify the server.
