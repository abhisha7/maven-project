pipeline {
    agent any
    tools {
        maven 'LocalMAVEN'
    }
    stages {
        stage ('biuld'){
            steps{
                sh 'mvn clean package'
            }
        }
    }
}
