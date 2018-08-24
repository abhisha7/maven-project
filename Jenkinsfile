pipeline {
    agent any
    tools {
        maven 'LocalMAVEN'
    }
    stages {
        stage ('biuld'){
            steps{
                sh 'mvn clean package'
                sh "docker build . -t tomcat:${env.BUILD_ID}"
                withCredentials([string(credentialsId: 'docker-pass3', variable: '')]) {
                    sh "docker push abhisha7/tomcat:${env.BUILD_ID}"
                }
            }
        }
        stage('run a container'){
            steps{
                def docker-run = 'docker run -p 8090:8080 tomcat:${env.BUILD_ID}'
                sshagent(['ssh-key']) {
                   sh "ssh ec2-user@52.204.227.78 $docker-run"
                }
            }
        }
    }
}
