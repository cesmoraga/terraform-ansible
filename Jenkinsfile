pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:light'
    }

  }
  stages {
    stage('error') {
      parallel {
        stage('error') {
          steps {
            sh 'terraform version'
          }
        }
        stage('test') {
          steps {
            sh 'hostname'
          }
        }
      }
    }
  }
  environment {
    env = 'test'
  }
}