
output "flux_install" {
  value = data.flux_install.main
}

output "flux_sync" {
  value = data.flux_sync.main
}

output "github_repository" {
  value = github_repository.main
}

output "github_branch_default" {
  value = github_branch_default.main
}

output "github_repository_deploy_key" {
  value = github_repository_deploy_key.main
}

output "github_repository_file_install" {
  value = github_repository_file.install
}

output "github_repository_file_sync" {
  value = github_repository_file.sync
}

output "github_repository_file_kustomize" {
  value = github_repository_file.kustomize
}

output "kubernetes_namespace" {
  value = kubernetes_namespace.flux_system
} 

output "kubectl_manifest_install" {
  value = kubectl_manifest.install
}

output "kubectl_manifest_sync" {
  value = kubectl_manifest.sync
}

