pipeline {
    agent any

    tools {
        maven 'M2_HOME'
    }

    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/OumaymaBrineg/DEVOPS_PROJECT.git'
                    // If private repo, add: credentialsId: 'jenkins-example-github-pat'
            }
        }

        stage('Code Build') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }

        stage('Maven Package') {
            steps {
                sh 'mvn package -Dmaven.test.skip=true'
            }
        }

        stage('Sonar Analysis') {
            steps {
                withSonarQubeEnv('MySonarQubeServer') {
                    // Hard-coded token
                    sh 'mvn sonar:sonar -Dsonar.projectKey=DEVOPS_PROJECT -Dsonar.login=squ_7f6652fe272214f32b42fa2814b4a2bb9d7daa79'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        always {
            echo "======always======"
        }
        success {
            echo "=====pipeline executed successfully ====="
        }
        failure {
            echo "======pipeline execution failed======"
        }
    }
}
