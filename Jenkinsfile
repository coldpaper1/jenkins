pipeline {
    agent any
    environment {
        SERVER = '52.79.141.200'
        HOST = 'ubuntu'
    }

    stages {

	stage("scm") {
		steps {
			git url: 'https://github.com/coldpaper1/jenkins.git', branch: 'test'
		
		}

	}


        stage("SonarQube") {
    		//`def scannerHome = tool 'sonarqube';
		steps {
        		script {
          			scannerHome = tool 'sonarqube'
        		}
        		withSonarQubeEnv('sonarqube') {
          			sh "${scannerHome}/bin/sonar-scanner"
        		}
      		}		
        }
	

        stage("docker build & push") {

		input {
                	message 'Please name the tag'
                	ok 'ok!'
                	parameters {
                    		string(name: 'TAG', defaultValue: 'v1', description: 'docker image tag')

                	}
		}

		steps {

                	sh '''
                	docker build -t mhkim1560/sonarqube:${TAG} .
                	docker push mhkim1560/sonarqube:${TAG}
                	'''

            	}	


	}
        stage("deploy") {
    		
		steps {
            sshagent(credentials: ['ubuntu']) {
            sh '''
                ssh -o StrictHostKeyChecking=no ${HOST}@${SERVER} "ls"                    
            ''' 
            }  
      	}

        }

	} 
}

