# Use the official Google Cloud SDK Alpine image as the base image
FROM google/cloud-sdk:alpine

# Set the working directory
WORKDIR /workspace

# Copy the script into the container
COPY download_artifacts_gcs.sh /workspace/download_artifacts_gcs.sh

# Make the script executable
RUN chmod +x /workspace/download_artifacts_gcs.sh

# Entry point for the container
ENTRYPOINT ["/workspace/download_artifacts_gcs.sh"]
