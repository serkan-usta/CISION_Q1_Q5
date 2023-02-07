# Use the official Nginx image as the base image
FROM nginx:1.19

# Install trivy and its dependencies
RUN apt-get update && apt-get install -y curl \
    && curl -L https://github.com/aquasecurity/trivy/releases/download/v0.37.1/trivy_0.37.1_Linux-64bit.tar.gz | tar xz \
    && chmod +x trivy \
    && mv trivy /usr/local/bin/ \
    && apt-get remove -y curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Perform security scanning of the base image (the build will fail if non-zero error code returned)
RUN trivy --quiet image nginx:1.19

# Copy the static content to the default Nginx HTML root directory
COPY html /usr/share/nginx/html

# Expose port 80 to receive incoming traffic
EXPOSE 80

# Start Nginx when the container is run
CMD ["nginx", "-g", "daemon off;"]
