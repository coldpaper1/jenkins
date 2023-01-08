pipeline {
    agent any

    stages {


	stage("scm") {
		steps {
			git url: 'https://github.com/coldpaper1/jenkins.git', branch: 'main'
		
		}

	}


        stage("SonarQube") {
		steps{
				sh "./var/jenkins_home/tools/hudson.plugins.sonar.SonarRunnerInstallation/sonarqube/bin/sonar-scanner -Dsonar.projectKey=jenkins   -Dsonar.sources=/var/jenkins_home/workspace/test@tmp  -Dsonar.host.url=http://3.35.104.93:9000   -Dsonar.login=sqp_baa83405135069036c620f4629fcfc015b868f80"
		

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
