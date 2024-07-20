# Fyle Backend Challenge

## Who is this for?

This challenge is meant for candidates who wish to intern at Fyle and work with our engineering team. You should be able to commit to at least 6 months of dedicated time for internship.

## Why work at Fyle?

Fyle is a fast-growing Expense Management SaaS product. We are ~40 strong engineering team at the moment. 

We are an extremely transparent organization. Check out our [careers page](https://careers.fylehq.com) that will give you a glimpse of what it is like to work at Fyle. Also, check out our Glassdoor reviews [here](https://www.glassdoor.co.in/Reviews/Fyle-Reviews-E1723235.htm). You can read stories from our teammates [here](https://stories.fylehq.com).


# Flask Application Dockerization

This guide explains how to containerize a Flask application using Docker. By following these steps, you can ensure your application runs consistently across different environments.

## Prerequisites

Before you start, make sure you have Docker and Docker Compose installed on your system. Docker allows you to containerize your applications, while Docker Compose is a tool for defining and running multi-container Docker applications. You can download Docker [here](https://www.docker.com/products/docker-desktop).

## Project Structure

Your project should have the following structure:

```
/YourFlaskApp
  - core/
      - __init__.py
      - server.py
  - Dockerfile
  - docker-compose.yml
  - requirements.txt
```

- `core/server.py`: The main Flask application.
- `requirements.txt`: Lists all necessary Python packages.

## Docker Setup

### Dockerfile

Create a `Dockerfile` in your project root with the following contents to set up the Python environment and Gunicorn server:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available outside this container
EXPOSE 8000

# Define the command to run the app using Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "core.server:app"]
```

### docker-compose.yml

Create a `docker-compose.yml` file for managing the application service:

```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - .:/app
```

This configuration starts your Flask application with Gunicorn and makes it accessible on port 8000.

## Build and Run

### Building the Application

Build the Docker image using:

```bash
docker-compose build
```

This command creates a Docker image based on the setup defined in your `Dockerfile`.

### Running the Application

Start your application by running:

```bash
docker-compose up
```

Now, your Flask application is running inside a Docker container and is accessible at `http://localhost:8000`.

### Stopping the Application

To stop and remove the containers, use:

```bash
docker-compose down
```

## Conclusion

Following this guide, your Flask application is fully dockerized, ensuring it runs the same way in any Docker-supported environment. This approach is especially useful for development and production consistency.

---


## Challenge outline

**You are allowed to use any online/AI tool such as ChatGPT, Gemini, etc. to complete the challenge. However, we expect you to fully understand the code and logic involved.**

This challenge involves writing a backend service for a classroom. The challenge is described in detail [here](./Application.md)


## What happens next?

You will hear back within 48 hours from us via email. 


## Installation

1. Fork this repository to your github account
2. Clone the forked repository and proceed with steps mentioned below

### Install requirements

```
virtualenv env --python=python3.8
source env/bin/activate
pip install -r requirements.txt
```
### Reset DB

```
export FLASK_APP=core/server.py
rm core/store.sqlite3
flask db upgrade -d core/migrations/
```
### Start Server

```
bash run.sh
```
### Run Tests

```
pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html
```

Certainly! Below is a sample README.md documentation formatted for GitHub, which explains how to dockerize and run your Flask application. This README includes Markdown formatting, which enhances readability and usability on GitHub.

---
