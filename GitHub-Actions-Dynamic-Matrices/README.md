# Dynamic Matrices in GitHub Actions

I often use GitHub Actions to deploy Azure resources, and recently, I needed a job to run multiple times based on how many WebApps needed deploying. To handle this, I set up a dynamic matrix in GitHub Actions, which allowed the job to run the required number of times. In this post, I will show you how to do this, with an example using folders in a repository instead of WebApps.y on a few workflows and thought I’d create a quick blog post on how to use dynamic environment variables with some examples

[Blog Post here](https://thomasthornton.cloud/2022/12/14/build-and-push-docker-image-to-azure-container-registry-using-github-action/)