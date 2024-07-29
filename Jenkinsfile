pipeline {
  agent any
      
  stages{
    stage('test'){
      steps {
        git 'https://github.com/matshidin/item4.git'
        
        
      }
    }    
   
    stage('build'){
      steps{
        script{
            withDockerRegistry(credentialsId: 'Dockerhub') {
                image = docker.build("shidee/angular-appitem4")
                image.push 'latest'
              }
    
             }
         }
          
      }
    
    stage('Az login') {
      steps{
          script {
            withCredentials([azureServicePrincipal('azurecred')])  {
            sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
        
          }
         }
      }
          
    }
    
    stage('Terraform init'){
        steps{
            script {
                sh 'terraform init'
            }
            
        }
    }

    stage('Terraform Plan') {
        steps {
            script {
                sh 'terraform plan -out=tfplan'
            }
        }
    }
    
    stage('Terraform Apply') {
        steps {
            script {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
    stage('Build') {
        steps {
            sshagent(['ssh_linux_vm']) {
                sh """ssh -o StrictHostKeyChecking=no -l adminuser 23.97.67.65 << EOF
                curl -fsSL https://get.docker.com -o get-docker.sh
                sudo sh get-docker.sh
                sudo docker pull shidee/angular-appitem4
                sudo docker run -d -p 5000:80 shidee/angular-appitem4
                exit
                EOF"""
            }
         }
      }
  }
}

