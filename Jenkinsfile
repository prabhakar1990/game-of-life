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
               sh 'mvn clean install'
          }
      }
   }  
   
}
