resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}

resource "helm_release" "redis" {
  name = "redis"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  namespace  = "test"
}