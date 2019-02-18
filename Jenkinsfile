pipeline {
  agent none
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