# drone-gcs-artifacts-download
This plugin is designed to download objects/artifacts from a GCS bucket. The primary goal of this plugin is to use GCP CLI to authenticate into a GCP account and download objects from a storage bucket.

## Build and Run using terminal

Clone the repo and use the following commands to run the script directly from the terminal. Make sure to export the respective environment variables and have GCP CLI installed on your local machine.

```bash
./path/to/repo/download_artifacts_gcs.sh
```

## Docker

Build the Docker image with the following commands. Using the following command, the image can be built for different OS and architecture. 

```
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t DOCKER_ORG/drone-gcs-artifacts-download .
```

## Usage

Use the following command to run the container using docker
```bash
docker run --rm \
-e PLUGIN_GCP_SERVICE_ACCOUNT_KEY=<"YourGCPServiceAccountKey"> \
-e PLUGIN_GCS_BUCKET_NAME=<"YourGCSBucketName"> \
-e PLUGIN_FETCH_DIR=<"YourFetchDirectory"> \
-e PLUGIN_DOWNLOAD_TARGET=<"YourDownloadTarget"> \
DOCKER_ORG/drone-gcs-artifacts-download
```

In Harness CI, the following YAML can be used to implement the plugin as a step
```yaml
            - step:
                  type: Plugin
                  name: drone-gcs-artifacts-download
                  identifier: dronegcsartifactsdownload
                  spec:
                    connectorRef: account.harnessImage
                    image: harnesscommunitytest/drone-gcs-artifacts-download
                    settings:
                      gcp_service_account_key: <+secrets.getValue("gcpserviceaccountkey")>
                      gcs_bucket_name: mybucket
                      fetch_dir: mydir
                      download_target: /harness
```
