pipeline {
    agent any
    tools {
        maven ''LocalMAVEN'
    }
    stages {
        stage ('biuld'){
            steps{
                sh 'mvn clean package'
                sh "docker build . -t tomcat:${env.BUILD_ID}" 
            }
        }
    }
}
