pipeline {
    agent any
    environment {
        registry = "rahmamessadi23/skistation"
        registryCredential = 'dockerhub'
        dockerImage = ''
    
    }
    stages {
        stage ('maven sonar') {
            steps {
                sh 'mvn clean'
                sh 'mvn compile'
                sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=admin1'
            }
        }
        stage ('maven build') {
            steps {
                sh 'mvn package'
            }
        }

        stage("PUBLISH TO NEXUS") {
            steps {
                sh 'mvn deploy'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

       


    }
}
