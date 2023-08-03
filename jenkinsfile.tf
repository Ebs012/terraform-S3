pipeline {
  agent any
  environment {
    AWS_ACCESS_KEY_ID = credentials('AKIA3E46JX7Z2G6S23FH')
    AWS_SECRET_ACCESS_KEY = credentials('xlqxBHUsqCa7b47xwmWxGBF5PdTYovMXTGxrxyMg')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/your-username/your-repo.git'
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Apply') {
      steps {
        withCredentials([
          awsAccessKey(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
          awsSecretKey(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
