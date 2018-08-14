pipeline {
    agent any

    tools {
          maven 'LocalMAVEN'
      }

    parameters {
        string(name: 'stage', defaultValue: '18.206.157.183', description: 'stage server')
        string(name: 'prod', defaultValue: '18.206.157.183', description: 'prod server')
    }

    triggers {
        pollSCM('* * * * *')
    }

stages {
        stage ('build'){
            steps{
                sh 'mvn clean install'
            }
            post {
                success {
                    echo 'Now Archiving'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('deployment'){
            parallel{
                stage ('stage'){
                    steps {
                        sh "scp -i /home/ec2-user/key.pem **/target/*.war ec2-user@${params.stage}:/var/lib/tomcat/webapps"
                    }
                }
                stage ('prod'){
                    steps {
                        sh "scp -i /home/ec2-user/key.pem **/target/*.war ec2-user@${params.prod}:/var/lib/tomcat/webapps"
                    }
                }
            }
        }
    }
}

