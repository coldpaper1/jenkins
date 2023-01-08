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

		def scannerHome = tool 'SonarQube';
                withSonarQubeEnv('SonarQube') { 
                sh "docker run --rm -e SONAR_HOST_URL='http://3.35.104.93:9000/' -e SONAR_SCANNER_OPTS='-Dsonar.projectKey=jenkinstest' -e SONAR_LOGIN='sqp_e7a37d9923448e4c25f352e2e222013968969b46' -v .:/usr/src sonarsource/sonar-scanner-cli"

                }


            }

         stage("docker build & push") {

            input {
                message 'Please name the tag'
                ok 'ok'
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

        post {
            success {
                echo "Good!!!!!!!!!!!!!!!"
            }


        }
    }
}
