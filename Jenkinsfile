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
      
      stage('NexusArtifactUploaderJob') {
    steps {
      nexusArtifactUploader {
        nexusVersion('nexus3')
        protocol('http')
        nexusUrl('localhost:9081')
        groupId('com.wakaleo.gameoflife')
        version('2.4')
        repository('NexusArtifactUploader')
        credentialsId('44620c50-1589-4617-a677-7563985e46e1')
        artifact {
            artifactId('gameoflife')
            type('war')
            classifier('debug')
            file('nexus-artifact-uploader.war')
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
