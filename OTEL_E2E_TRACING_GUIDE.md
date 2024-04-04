> Prerequisit: Have Docker Engine and Docker Compose are installed (both included with Docker Desktop)  

## Steps breakdown:

1. Install Maven:
```
brew install maven
```

2. Build Spring Boot application with Java 17:
```
mvn clean install
```

3. Start docker compose: 
```
docker-compose up -d
```

4. Start docker compose: 
```
docker-compose up -d
```

5. Register JDBC sink connector:
```
curl -X POST localhost:8083/connectors -H "Content-Type: application/json" -d @./connector/debezium-jdbc-sink-connector.json
```

6. Register Postgres source connector for CDC:
```
curl -X POST localhost:8083/connectors -H "Content-Type: application/json" -d @./connector/debezium-postgres-source-connector.json
```

7. Send a POST request to the application to invoke an DB insert
```
curl -i -X POST localhost:9001/v1/item -H "Content-Type: application/json" -d '{"name": "test-item"}'
```


## Note for other forwarded ports
- Zipkin is avaliable at `localhost:9411`
- Confluent control center (UI tool for Kafka cluster) is avaliable at `localhost:9021`
- Postgres DB is on port `localhost:5433`