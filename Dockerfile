# Use official OpenJDK image as the base image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy project files
COPY . .

# Download dependencies and build the project
RUN ./gradlew build --no-daemon

# Copy the JAR file into the container
COPY build/libs/*.jar app.jar

# Expose the Eureka port
EXPOSE 8761

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
