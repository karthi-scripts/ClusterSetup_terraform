provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  required_version = ">= 0.12"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.7.1"
    }
     helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7.1"

    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.68.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
     gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 3.15.0"  # Specify the version constraint
    }
  }

}

