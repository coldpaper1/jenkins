pipeline {      
  agent any    

parameters {            // Pipeline이 동작할 때 넘겨 받는 인자 값들
  booleanParam(name : 'BUILD_DOCKER_IMAGE', defaultValue : true, description : 'BUILD_DOCKER_IMAGE')
  booleanParam(name : 'RUN_TEST', defaultValue : true, description : 'RUN_TEST')
  booleanParam(naeme : 'PUSH_DOCKER_IMAGE', defaultValue : true, description : 'PUSH_DOCKER_IMAGE')


}

environment {       // 환경변수를 지정하는 것으로 지금 현재 위치는 pipline 블럭 바로 아래 있기 때문에 전체 stage에 영향을 준다.

    REGION = "ap-northeast-2" 
}

stages {    //stage 시작 블럭
  stage('Docker image build') {
    
    when {
    expression { return params.BUILD_DOCKER_IMAGE }     // 위에 선언한 booleanParam의 값이 true이면 실행하겠다는 옵션
    }

    steps {

      dir("${env.WORKSPACE}") {   // WORKSPACE라는 변수를 Jenkins에서 예약된 환경변수 해당 디렉토리를 workdir로 하겠다는 의미.
        sh 'docker build -t mhkim1560/jenkins:1 .'

      }

    }
    
    post {
      always {      //작업의 성공여부 상관없이 해당 스크립트를 실행.
        echo "Docker build test"
      }

    }



  }



}


}


