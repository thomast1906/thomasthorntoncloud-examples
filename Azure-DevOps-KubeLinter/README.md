## Analyze your Kubernetes YAML files and ensure best practices using KuberLinter in Azure DevOps

Deploying a number of YAML files as part of your Kubernetes deployment? Unsure if they are representing best practices? KubeLinter will help you to achieve best practices within your YAML configurations (can also include Helm charts) and I will show how you can add this tool as part of your CI integration tooling or general pipeline running on Azure DevOps! 

### Purpose
This repository contains code that uses KubeLinter to analyze Kubernetes YAML files and ensure they follow best practices. The code is designed to be integrated into a CI pipeline running on Azure DevOps.

### Usage
To use this code, clone the repository and run the script in your Azure DevOps pipeline. The script will analyze your Kubernetes YAML files and output a report of any issues it finds.

### Prerequisites/Dependencies
You will need an Azure DevOps account and a Kubernetes cluster. You will also need to install KubeLinter.

[Blog post here](https://thomasthornton.cloud/2022/04/13/analyze-your-kubernetes-yaml-files-and-ensure-best-practices-using-kuberlinter-in-azure-devops/)