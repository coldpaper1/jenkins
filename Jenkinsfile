pipeline {
    agent any

    stages {

        stage("setting") {
            input {
                message 'what is your name???'
                ok 'ok!!!'
                parameters {
                    string(name: 'NAME', defaultValue: 'jongchan', description: 'pipeline syntax example')
                    


                }
            }

            steps {
                echo "${NAME}"




            }
        }

        stage("docker build & push") {

            input {
                message 'what is TAG name ???'
                ok 'ok!!!'
                parameters {
                    string(name: 'TAG', defaultValue: 'Quiz1', description: 'docker image tag')

                }
            }
            steps {

                git url: 'https://github.com/coldpaper1/jenkins.git', branch: 'main'

                sh '''
                docker build -t mhkim1560/jenkins:${TAG} .
                docker push mhkim1560/jenkins:${TAG}
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





