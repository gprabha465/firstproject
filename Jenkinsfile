pipeline {
    agent any
    environment {
        GITHUB_TOKEN = credentials('githubuser')
        AWS_CREDENTIALS = credentials('AWSs3bucketaccess')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/gprabha465/firstproject', credentialsId: 'githubuser'
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSs3bucketaccess']]) {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSs3bucketaccess']]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
