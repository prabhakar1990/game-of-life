pipeline {
   agent any
   tools { maven 'MAVEN_HOME' }
   stages {
      stage('Github-Code Checkout') {
         steps {
            git url: 'https://github.com/prabhakar1990/game-of-life.git'
         }
      }
      stage ('Maven- Code Build') {
          steps {
             withSonarQubeEnv('Sonarqube') {
               sh 'mvn clean install sonar:sonar'
          }
          }
      }

      stage ('Sonarqube- Code Quality Analysis') {
          steps {
             withSonarQubeEnv('Sonarqube') {
               sh 'mvn clean install sonar:sonar'
          }
          }
      }
      
      Stage ('Nexus Deploy') {
     steps {
      nexusArtifactUploader {
        artifactId: 'gameoflife',
        file: 'server/jetty-project/target/jetty-project-0.0.1-SNAPSHOT.war',
        groupId: 'com.wakaleo.gameoflife',
        type:'war',
        nexusPassword: 'admin',
        nexusUrl: 'http://127.0.0.1:9081/',
        nexusUser: 'admin',
        nexusVersion: 'nexus3.19',
        protocol: 'http',
        repository: 'maven-snapshots',
        version: '0.0.1-SNAPSHOT'
             }
         }
       }
      
     
      stage ('Deploy to tomcat') {
         steps {
            sh 'chmod 755 deploy.sh'
            sh 'sh deploy.sh'
         }
      }   
    
   }  
   
}
