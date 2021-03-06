#!/bin/bash

# Exit in case of error
set -e

# Build and run containers
docker-compose up --build -d

# Hack to wait for postgres container to be up before running alembic migrations
sleep 5;
gh
# Run migrations
docker-compose run --rm backend alembic upgrade head

# Create initial data
docker-compose run --rm backend python3 app/initial_data.py