
FROM maven:3.6.3-jdk-8 AS builder

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-slim

WORKDIR /app
COPY --from=builder /app/target/VNPAY-Demo-0.0.1.war .

CMD ["java", "-jar", "VNPAY-Demo-0.0.1.war"]
