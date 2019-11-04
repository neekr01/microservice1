#!/usr/bin/env groovy

// node {
//     stage('checkout') {
//         checkout scm
//     }

//     docker.image('jhipster/jhipster:v6.4.1').inside('-u jhipster -e MAVEN_OPTS="-Duser.home=./"') {
//         stage('check java') {
//             sh "java -version"
//         }

//         stage('clean') {
//             sh "chmod +x mvnw"
//             sh "./mvnw -ntp clean"
//         }

//         stage('backend tests') {
//             try {
//                 sh "./mvnw -ntp verify"
//             } catch(err) {
//                 throw err
//             } finally {
//                 junit '**/target/test-results/**/TEST-*.xml'
//             }
//         }

//         stage('packaging') {
//             sh "./mvnw -ntp verify deploy -Pprod -DskipTests"
//             archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
//         }
//         stage('quality analysis') {
//             withSonarQubeEnv('sonar') {
//                 sh "./mvnw -ntp initialize sonar:sonar"
//             }
//         }
//     }

//     def dockerImage
//     stage('publish docker') {
//         // A pre-requisite to this step is to setup authentication to the docker registry
//         // https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin#authentication-methods
//         sh "./mvnw -ntp jib:build"
//     }
// }


pipeline{
    agent any
    tools {
        maven 'maven-362'
    }
    stages{
        stage('Git Clone'){
        steps{
            git credentialsId: 'GIT_CREDENTIALS', url: 'https://github.com/neekr01/microservice1.git'
        }
    }
    
    stage('Maven clean'){
        steps{
        sh "mvn clean"
        }
    }
    stage('Maven build'){
         steps{
        sh "mvn package"
    }
    }

    stage('Docker Image'){
        steps{
        sh "docker build -t neekr01/microservice1 ."
        }
    }

     stage('Docker Push'){
         steps{
    withCredentials([string(credentialsId: 'DOCKER_HUB_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
   sh "docker login -u neekr01 -p {DOCKER_HUB_CREDENTIALS}"
}
        sh "docker push neekr01/microservice1 "
        }
    }
 }  
}