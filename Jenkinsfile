pipeline {
    agent any

    stages {
	stage("git checkout") {
		steps {
			git url: 'https://github.com/coldpaper1/jenkins.git', branch: 'main'
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
            docker build -t mhkim1560/simple-fastapi:${TAG} .
            docker push mhkim1560/simple-fastapi:${TAG}
            '''
        }
	 }
   }
}
