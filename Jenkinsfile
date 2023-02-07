pipeline {
    agent any
    
    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
                sh '''./mvnw package
		docker-compose build
		'''
            }
		post {
			always {
				junit 'target/surefire-reports/*.xml'
			}
		}
        }
        stage('Deploy') {
            steps {
                sh '''docker-compose up -d
                docker-compose logs -t --tail=10 
                '''
            }
        }
    }
}
