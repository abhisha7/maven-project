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
            }
        }
        stage('runa container'){
            steps{
                sh "docker run -p 8090:8080 -d tomcat:${env.BUILD_ID}" 
            }
        }
    }
}
