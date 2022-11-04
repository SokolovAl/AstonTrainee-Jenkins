pipeline {
    agent any
    environment {
                TOMCAT_ACCESS_CRED = credentials('tomcat_cred')
                DOCKERHUB_CREDENTIALS=credentials('docker_cred')
            }
    tools {
        maven 'maven'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
                }
            }
        stage('Test') {
            steps {
                echo 'testing stage'
            }
        }
       stage('Deploy') {
              steps {
                  script{
                sh (script: "curl -s --upload-file **/*.jar '${TOMCAT_ACCESS_CRED}@192.168.1.110:9090/manager/text/deploy?path=/spring-boot-0.0.1-SNAPSHOT&update=true'")
               }
           }
       }
       stage('Deployment') {
                 steps {
                    sh 'docker build -f Dockerfile -t youthmono/spring-boot-0.0.1-SNAPSHOT:latest .'
                }
             }

        stage('Login') {
                  steps {
                     sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                }
             }

        stage('Push') {

       			steps {
       				sh 'docker push youthmono/spring-boot-0.0.1-SNAPSHOT:latest'
       			}
       		}
      }
        post {
            	always {
            		sh 'docker logout'
            	}
        }
    }

