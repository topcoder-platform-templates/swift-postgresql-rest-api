# Create image
```
docker build -t postgres-test .
```

# Start new PostgreSQL container from the image
```
docker run -d -p 5432:5432 --name postgres-test1 -e POSTGRES_PASSWORD=myPassword postgres-test
```

# Connect to container to verify what's inside
```
docker exec -it postgres-test1 bash
```
