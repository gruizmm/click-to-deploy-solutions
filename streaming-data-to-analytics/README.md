[![banner](../banner.png)](https://cloud.google.com/?utm_source=github&utm_medium=referral&utm_campaign=GCP&utm_content=packages_repository_banner)

# Streaming Data to Analytics

## Description

This example demonstrates how to stream data from your application to BigQuery using Pub/sub.

Resources created:
- BigQuery dataset and table
- Pub/Sub topic and BQ subscription
- Cloud Run Ingest API

:clock1: Estimated deployment time: 2 min

## Architecture
![architecture](architecture.png)

## Deploy

1. Click on Open in Google Cloud Shell button below.

<a href="https://ssh.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_git_repo=https://github.com/GoogleCloudPlatform/click-to-deploy-solutions&cloudshell_workspace=streaming-data-to-analytics" target="_new">
    <img alt="Open in Cloud Shell" src="https://gstatic.com/cloudssh/images/open-btn.svg">
</a>

2. Run the `deploy.sh` script
```
sh cloudbuild.sh
```

## Test your solution
If you want to run a load test, please follow the instructions below.

1. Set GCP_TOKEN env var
```
export GCP_TOKEN=$(gcloud auth print-identity-token)
```

2. Create a python virtual env and activate it
```
cd load_test
python3 -m virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
```

3. Run locust with your Cloud Run Service URL as target, for example:
```
locust -f locustfile.py --headless -u 100 -r 10 \
    --run-time 30m \
    -H https://<YOUR CLOUD RUN SERVICE URL>/
```

4. Query the events on [BigQuery](https://console.cloud.google.com/bigquery)
```
SELECT *
FROM `ecommerce_raw.order_event`
WHERE DATE(publish_time) >= CURRENT_DATE()
LIMIT 1000
```


## Destroy
Execute the command below on Cloud Shell to destroy the resources.
```
sh cloudbuild.sh destroy
```

This is not an official Google product.
