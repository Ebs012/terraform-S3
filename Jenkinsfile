pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('my-ebs-aws-credential')
    AWS_SECRET_ACCESS_KEY = credentials('my-ebs-aws-credential')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Ebs012/terraform-S3.git'
      }
    }
   stage('Terraform Init') {
     steps {
       sh 'terraform init'
      }
    }
    stage('Terraform Apply') {
      steps {
        withAWS(region: 'eu-west-2', credentials: 'my-ebs-aws-credential') {
          sh 'terraform apply -auto-approve'
        }
      }
    }
