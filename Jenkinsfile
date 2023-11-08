pipeline {
   agent any  
   environment{
        DOCKERHUB_CREDENTIALS=credentials('CredentialHub')
   }

stages {


  stage('Cleaning the project') {
                steps {
                sh 'mvn clean'
                }
        }

    stage('MVN compile') {
                steps {
                sh 'mvn compile'
                }
}

stage('SONARQUBE'){
 steps {
 sh"mvn clean verify sonar:sonar \
  -Dsonar.projectKey=MyProject \
  -Dsonar.projectName='MyProject' \
  -Dsonar.host.url=http://192.168.33.10:9000 \
  -Dsonar.token=sqp_1143f466c9ad749828d1528815a88cfb48596b80"
 }
 }
 
 
 stage('MVN build'){
           steps{
                sh 'mvn -B -DskipTests package'
             }
}


 

 
    stage('Publish to Nexus') {
steps {
script {
            sh 'mvn deploy -Dmaven.test.skip   '
          }
}
 
}

 
 stage('Build Docker Image') {
      steps {
        script {
         sh 'docker build -t rimadab/spring-app .'
          }
      }
     }


 stage('Login Dockerhub') {
      steps {

      sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
      }
   }

    stage('Push Docker Image') {
      steps {
        sh 'docker push rimadab/spring-app'
      }
    }  

 stage('DOCKER-COMPOSE'){
         
steps{
             
script{
                   sh 'docker compose up -d'
                       }
               }
}


 
      }
}
