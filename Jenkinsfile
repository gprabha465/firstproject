pipeline {
    agent any
    environment {
        GITHUB_TOKEN = credentials('jenkins-access')
        AWS_CREDENTIALS = credentials('aws-credentials')
        TF_HOME = "${WORKSPACE}/terraform"
    }
    options {
        skipDefaultCheckout()
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/gprabha465/firstproject', credentialsId: 'jenkins-access'
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    sh 'terraform init -backend-config=backend.tfvars'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    sh 'terraform plan'
                }
            }
        }
        stage('Input') {
            steps {
                input(message: 'Please review tf plan and approve', ok: 'Proceed')
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
