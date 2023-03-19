pipeline {
    agent any
   
    stages {
	stage('Checkout') {
	   steps {
	      withCredentials([usernamePassword(credentialsId: '[credentialsId]', usernameVariable: 'GITHUB_USERNAME', passwordVariable: 'GITHUB_ACCESS_TOKEN')]) {
		 checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/PrameshKhanal/participant_attributes', credentialsId: '[credentialsId]']]])
	   }
        }
    }
        stage('Robot Framework Test') {
	   steps {
	      bat 'robot -d results --variable BROWSER:chrome .\tests\new_application.robot'
           }
        }
    }

    post {
        always {
            robot(
                outputPath: 'Results',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                outputFileName: 'output.xml',
                otherFiles: '*screenshot*.jpg',
                enableCache: false
            )
        }
    }
}
