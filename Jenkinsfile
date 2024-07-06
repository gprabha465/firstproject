pipeline {
    agent any
    environment {
        GITHUB_TOKEN = credentials('github')
        AWS_CREDENTIALS = credentials('aws-credentials')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/gprabha465/firstproject', credentialsId: 'github'
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
