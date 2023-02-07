pipeline {
    agent any
    
    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Test') {
            steps {
                sh './mvnw test'
            }
		post {
			always {
				junit 'target/surefire-reports/*.xml'
			}
		}
        }
        stage('Build') {
            steps {
                sh '''./mvnw package
		docker-compose build
		'''
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
