pipeline {
    agent any

    stages {


	stage("scm") {
		steps {
			git url: 'https://github.com/coldpaper1/jenkins.git', branch: 'main'
		
		}

	}


        stage("SonarQube") {
		
            steps {

		//def scannerHome = tool 'SonarQube';
                withSonarQubeEnv(credentialsId:'sonarqube', installationName:'SonarQube') { 
                sh "SonarQube/bin/sonar-scanner"

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


        



        
    }
}
