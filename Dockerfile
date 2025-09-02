# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

# Run a simple Python app
CMD ["python", "-c", "print('Hello from Docker!')"]
