---
# Flask Application Dockerization

This guide explains how to containerize a Flask application using Docker. By following these steps, we can ensure our application runs consistently across different environments.

## Prerequisites

Before we start, we need to make sure we have Docker and Docker Compose installed on our system. Docker allows us to containerize our applications, while Docker Compose is a tool for defining and running multi-container Docker applications.

## Project Structure

Our project should have the following structure:

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

We can create a `Dockerfile` in your project root with the following contents to set up the Python environment and Gunicorn server:

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

Firstly, we can create a `docker-compose.yml` file for managing the application service:

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

This configuration starts the Flask application with Gunicorn and makes it accessible on port 8000.

## Build and Run

### Building the Application

We can build the Docker image using:

```bash
docker-compose build
```

This command creates a Docker image based on the setup defined in the `Dockerfile`.

### Running the Application

We need to start the application by running:

```bash
docker-compose up
```
Now, the Flask application is running inside a Docker container and is accessible at `http://localhost:8000`.

### Stopping the Application

To stop and remove the containers, we need to use:

```bash
docker-compose down
```

## Conclusion

Following this guide, the Flask application is fully dockerized, ensuring it runs the same way in any Docker-supported environment. This approach is especially useful for development and production consistency.

---

# Fyle Backend Challenge

## Who is this for?

This challenge is meant for candidates who wish to intern at Fyle and work with our engineering team. You should be able to commit to at least 6 months of dedicated time for internship.

## Why work at Fyle?

Fyle is a fast-growing Expense Management SaaS product. We are ~40 strong engineering team at the moment. 

We are an extremely transparent organization. Check out our [careers page](https://careers.fylehq.com) that will give you a glimpse of what it is like to work at Fyle. Also, check out our Glassdoor reviews [here](https://www.glassdoor.co.in/Reviews/Fyle-Reviews-E1723235.htm). You can read stories from our teammates [here](https://stories.fylehq.com).


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
