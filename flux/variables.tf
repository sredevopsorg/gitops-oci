variable "github_owner" {
  type        = string
  description = "The GitHub organization or user account that owns the repository."
}

variable "github_token" {
  type        = string
  description = "The GitHub personal access token that has write access to the repository."
}

variable "repository_name" {
  type        = string
  description = "The name of the repository to create."
}

variable "repository_visibility" {
  type        = string
  description = "The visibility of the repository to create."
  default     = "private"
}

variable "branch" {
  type        = string
  description = "The branch to use for the repository."
  default     = "main"
}

variable "target_path" {
  type        = string
  description = "The path to the directory where Flux manifests will be installed."
  default     = "flux-system"
}

