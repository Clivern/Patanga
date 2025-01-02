# Use the official Elixir image as the base image
FROM elixir:1.18.1-alpine

# Install any necessary dependencies
RUN apk add --update make

# Set the working directory for the application
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Install the application dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix compile

# Start the server
CMD ["mix", "run", "--no-halt"]
