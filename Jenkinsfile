pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:light'
    }

  }
  stages {
    stage('error') {
      steps {
        sh 'terraform version'
      }
    }
  }
  environment {
    env = 'test'
  }
}