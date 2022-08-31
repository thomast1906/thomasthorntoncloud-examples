locals {
  apps = {

    app01 = {
      targetPort  = 80
      image       = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      imagename   = "simple-hello-world-container"
      minReplicas = 0
      maxReplicas = 2
      cpu         = 0.25
      memory      = "0.5Gi"
    },
    app02 = {
      targetPort  = 80
      image       = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      imagename   = "simple-hello-world-container"
      minReplicas = 0
      maxReplicas = 2
      cpu         = 0.25
      memory      = "0.5Gi"
    }
  }
}