pipeline {
  agent any
  stages {
    stage('Terraform Initialization') {
      steps {
        sh "rm -rf .terraform"
        sh "terraform init"
        sh "terraform validate"
      }
    }
    stage('Terraform Plan') {
      steps {
        sh "terraform plan"
      }
    }
    stage('Terraform Apply') {
      steps {
        sh "terraform apply --auto-approve"
      }
    }
  }
}