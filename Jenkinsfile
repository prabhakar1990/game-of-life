pipeline {
   agent any
   tools { maven 'MAVEN_HOME' }
   stages {
      stage('Git Clone from Repo') {
         steps {
            git url: 'https://github.com/prabhakar1990/game-of-life.git'
         }
      }
      stage ('maven build') {
          steps {
             withSonarQubeEnv('Sonarqube') {
               sh 'mvn clean install sonar:sonar'
          }
          }
      }

      stage ('Sonar-Anylysis') {
          steps {
             withSonarQubeEnv('Sonarqube') {
               sh 'mvn clean install sonar:sonar'
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
