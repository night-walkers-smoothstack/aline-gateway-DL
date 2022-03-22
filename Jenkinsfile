pipeline{
    agent{
        label "docker && maven"
    }
    environment {
        REGISTRY_URI="public.ecr.aws/l4g0u1s9/aline-services-dl"
        APP_NAME="aline-gateway"
        APP_VERSION="0.0.1-SNAPSHOT"
    }
    stages{
        stage("Package"){
            steps{
                sh 'mvn clean package -DskipTests'
            }
            // post{
            //     always{
            //         echo "========always========"
            //     }
            //     success{
            //         echo "========A executed successfully========"
            //     }
            //     failure{
            //         echo "========A execution failed========"
            //     }
            // }
        }
        stage("Build"){
            steps{
                sh """
                    docker build -t ${APP_NAME}:${APP_VERSION}
                """
            }
        }

        stage("Push to ECR"){
            steps{
                sh """
                    # add repo tag
                    docker tag ${APP_NAME}:${APP_VERSION} ${REGISTRY_URI}/${APP_NAME}:${APP_VERSION}
                    # push to repo
                    docker push ${REGISTRY_URI}/${APP_NAME}:${APP_VERSION}
                """
            }
        }
    }
    // post{
    //     always{
    //         echo "========always========"
    //     }
    //     success{
    //         echo "========pipeline executed successfully ========"
    //     }
    //     failure{
    //         echo "========pipeline execution failed========"
    //     }
    // }
}