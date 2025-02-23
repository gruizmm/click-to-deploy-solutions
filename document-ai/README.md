[![banner](../banner.png)](https://cloud.google.com/?utm_source=github&utm_medium=referral&utm_campaign=GCP&utm_content=packages_repository_banner)

# Document AI

This example deploys a solution for extracting data from documents with Document AI.

The user uploads documents to a bucket, it triggers a function and sends the document to the Document AI API, then save the results into Google Cloud Storage and BigQuery.

:clock1: Estimated deployment time: 10 min

:heavy_dollar_sign: Estimated solution cost: it depends on the volume of data stored, please take a look at [this example](https://cloud.google.com/products/calculator/#id=7e79b4d5-7060-4ab4-a78e-d81dadc8a9fb).

## Architecture
![architecture](architecture.png)

## Deploy

1. Click on Open in Google Cloud Shell button below.

<a href="https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/click-to-deploy-solutions&cloudshell_workspace=document-ai" target="_new">
    <img alt="Open in Cloud Shell" src="https://gstatic.com/cloudssh/images/open-btn.svg">
</a>

2. Run the `cloudbuild.sh` script and follow the instructions
```
sh cloudbuild.sh
```

## Testing 

Once you deployed the solution successfully, upload the `form.pdf` to the input bucket using either Cloud Console or `gsutil`.
```
gsutil cp form.pdf gs://<YOUR PROJECT NAME>-doc-ai-form-input
```

Then, check the parsed results in the output bucket in text (OCR) and json (Key=value) formats

![gcs_results](gcs_results.png)

Finally, check the json results on BigQuery

![bq_results](bq_results.png)

## Destroy
Execute the command below on Cloud Shell to destroy the resources.
```
sh cloudbuild.sh destroy
```

## Known issues

You might face the error below while running it for the first time.

```
Step #2 - "tf apply": │ Error: Error creating function: googleapi: Error 400: Cannot create trigger projects/doc-ai-test4/locations/us-central1/triggers/form-parser-868560: Invalid resource state for "": Permission denied while using the Eventarc Service Agent.

If you recently started to use Eventarc, it may take a few minutes before all necessary permissions are propagated to the Service Agent. Otherwise, verify that it has Eventarc Service Agent role.
```

That happens because the Eventarc permissions take time to propagate. Please wait some minutes and try again.

## Useful links
- [Form Parsing with Document AI](https://codelabs.developers.google.com/codelabs/docai-form-parser-v1-python#0)
- [Use a Document AI para processar seus formulários escritos à mão de maneira inteligente (Python)](https://codelabs.developers.google.com/codelabs/docai-form-parser-v3-python?hl=pt-br#0) (Portuguese)

