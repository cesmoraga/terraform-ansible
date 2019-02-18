pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:light'
    }

  }
  stages {
    stage('') {
      steps {
        sh 'terraform version'
      }
    }
  }
  environment {
    env = 'test'
  }
}