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
        stage('Setup Terraform') {
            steps {
                script {
                    // Download Terraform binary
                    sh '''
                    mkdir -p ${TF_HOME}
                    wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip -O ${TF_HOME}/terraform.zip
                    unzip ${TF_HOME}/terraform.zip -d ${TF_HOME}
                    rm ${TF_HOME}/terraform.zip
                    chmod +x ${TF_HOME}/terraform
                    whoami
                    '''
                }
            }
        }
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/gprabha465/firstproject', credentialsId: 'github'
            }
        }
        stage('Terraform Init') {
            steps {
               script {
                   // Construct the Git URL with the token
                    def gitUrl = "https://${GITHUB_TOKEN}@github.com/gprabha465/firstproject.git"
                    // Perform the Git checkout
                   checkout([$class: 'GitSCM', branches: [[name: '*/dev']], userRemoteConfigs: [[url: gitUrl]]])
               }
      }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    sh '${TF_HOME}/terraform plan'
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
                    sh '${TF_HOME}/terraform apply -auto-approve'
                }
            }
        }
    }
    post {
        always {
            // Cleanup Terraform binary
            sh 'rm -rf ${TF_HOME}'
        }
    }
}
