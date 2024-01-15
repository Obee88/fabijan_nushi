def imageName = 'unset'

pipeline {
    agent any
    stages {
        stage('Define image name') {
            steps {
                script {
                    imageName = "fabijan_nushi:${BUILD_NUMBER}"
                }
                echo "imageName: ${imageName}"
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh "docker build -t ${imageName} --progress plain ."
                }
            }
        }
        stage('Clean old resources') {
            steps {
                script {
                    sh "docker ps -a --format '{{.Names}}' | grep -E \"fabijan_nushi\" | xargs -r docker rm -f"
                }
                script {
                    def minTag = BUILD_NUMBER.toInteger() - 2
                    sh "docker images | grep 'fabijan_nushi' | awk '\$2 < $minTag {print \$1\":\"\$2}' | xargs -r docker rmi"
                }
            }
        }
        stage('Run docker container') {
            steps {
                script {
                    sh "docker run --name fabijan_nushi -d $imageName -p 2001:80"
                }
            }
        }
    }
}