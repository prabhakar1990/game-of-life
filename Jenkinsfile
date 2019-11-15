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
      stage('Nexus- punlish war){
            steps{
               nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'maven-releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/Users/Share/Jenkins/Home/workspace/GAMEOFLIFE_using _tomcat_container_SQ/gameoflife-web/target/gameoflife.war']], mavenCoordinate: [artifactId: 'gameoflife', groupId: 'com.wakaleo.gameoflife', packaging: 'war', version: '5.0']]]
               
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

