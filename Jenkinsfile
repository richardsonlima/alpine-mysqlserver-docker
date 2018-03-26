pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t richardsonlima/alpine-mysqlserver:1.0.1 .'
            }
        }
        stage('Push to dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push richardsonlima/alpine-mysqlserver:1.0.1'
            }
         }
      }
   }
}
