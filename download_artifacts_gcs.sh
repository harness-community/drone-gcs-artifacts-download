#!/bin/bash

# Check if required environment variables are set
if [ -z "$PLUGIN_GCP_SERVICE_ACCOUNT_KEY" ] || [ -z "$PLUGIN_GCS_BUCKET_NAME" ] || [ -z "$PLUGIN_FETCH_DIR" ] || [ -z "$PLUGIN_DOWNLOAD_TARGET" ]; then
  echo "Error: Please provide all required environment variables."
  exit 1
fi

# Set GCP service account key and authenticate
echo "$PLUGIN_GCP_SERVICE_ACCOUNT_KEY" > /tmp/gcp-service-account-key.json
gcloud auth activate-service-account --key-file=/tmp/gcp-service-account-key.json

# Download artifacts from GCS bucket to the specified target
gsutil -m cp -r "gs://$PLUGIN_GCS_BUCKET_NAME/$PLUGIN_FETCH_DIR/*" "$PLUGIN_DOWNLOAD_TARGET"

