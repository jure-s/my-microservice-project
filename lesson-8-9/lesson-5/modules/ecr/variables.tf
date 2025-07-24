variable "repository_name" {
  description = "Назва ECR репозиторію"
  type        = string
  default     = "ihor-microservice-ecr"
}

variable "scan_on_push" {
  description = "Сканувати образи при завантаженні"
  type        = bool
  default     = true
}
