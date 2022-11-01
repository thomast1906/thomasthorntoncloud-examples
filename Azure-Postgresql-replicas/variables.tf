variable "replicas" {
  description = "Names of additional replica databases to create"
  default = [
    "replica1",
    "replica2"
  ]
}