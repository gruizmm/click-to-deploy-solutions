[![banner](../banner.png)](https://cloud.google.com/?utm_source=github&utm_medium=referral&utm_campaign=GCP&utm_content=packages_repository_banner)

# Data Analytics Platform event-driven

## Description

This example demonstrates how to load files from Google Cloud Storage to BigQuery using an event-driven load function. 

The user uploads the data into the Upload Bucket following the pattern `gs://your-upload-bucket/dataset-name/table-name/file.csv`, then it triggers a Cloud Function that extracts the parameters from the object path and then load the file into the proper destination table.

:clock1: Estimated deployment time: 8 min

:heavy_dollar_sign: Estimated solution cost: it depends on the volume of data inserted, please estimate it using [Google Cloud Pricing Calculator](https://cloud.google.com/products/calculator)


## Architecture
Please find below a reference architecture.
![architecture](architecture.png)

## Deploy

1. Click on Open in Google Cloud Shell button below.
<a href="https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/click-to-deploy-solutions&cloudshell_workspace=data-analytics-platform-event-driven" target="_new">
    <img alt="Open in Cloud Shell" src="https://gstatic.com/cloudssh/images/open-btn.svg">
</a>

2. Run the `cloudbuild.sh` script and follow the instructions
```
sh cloudbuild.sh
```

Once it is finished, you can go to [Cloud Composer](https://console.cloud.google.com/composer/environments) to see the dags' results and explore the Cloud Composers's functionalities.


## Testing
After you deployed the solution, you can test it by loading the sample file on this repository to the upload bucket by running the `gsutil` command below, or uploading using the console.
```
gsutil cp sample_data/order_events_001.csv gs://your-upload-bucket/ecommerce/order_events/
```

Then, check the uploaded data on BigQuery > ecommerce dataset > order_events table.

## Destroy

1. Click on Open in Google Cloud Shell button below.
<a href="https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/click-to-deploy-solutions&cloudshell_workspace=data-analytics-platform-event-driven" target="_new">
    <img alt="Open in Cloud Shell" src="https://gstatic.com/cloudssh/images/open-btn.svg">
</a>

2. Run the `cloudbuild.sh` script with `destroy` argument
```
sh cloudbuild.sh destroy
```
