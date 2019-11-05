#!/usr/bin/env groovy



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
   sh "docker login -u neekr01 -p ${DOCKER_HUB_CREDENTIALS}"
}
        sh "docker push neekr01/microservice1 "
        }
    }
    
stage("Deploy Application on k8s Cluster"){
steps{
     
		kubernetesDeploy(
            
			configs: 'microservice1.yml',
            
			kubeconfigId: 'KUBERNETES_CLUSTER_CONFIG',
            
			enableConfigSubstitution: true
            
        
		)
    
	}
}


 }  
}