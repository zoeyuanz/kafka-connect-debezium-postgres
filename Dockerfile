FROM openjdk:17.0.2-jdk-slim
ARG JAR_FILE=target/*.jar
ARG OTEL_FILE=otel/otel-agent.jar

COPY ${JAR_FILE} app.jar
COPY ${OTEL_FILE} otel-agent.jar

# ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.2.0/opentelemetry-javaagent.jar /otel-javaagent.jar

# RUN chmod 444 /otel-javaagent.jar

ENV OTEL_SERVICE_NAME=app-postgres-writer
ENV OTEL_TRACES_EXPORTER=zipkin
ENV OTEL_LOGS_EXPORTER=none
ENV OTEL_METRICS_EXPORTER=none
ENV OTEL_EXPORTER_ZIPKIN_ENDPOINT=http://zipkin:9411/api/v2/spans

ENV JAVA_OPTS="-javaagent:/otel-agent.jar"

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar"]
