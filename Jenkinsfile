pipeline{
    agent{
        label "docker && maven"
    }
    environment {
        REGISTRY-URI="public.ecr.aws/l4g0u1s9/aline-services-dl"
        APP-NAME=""
        APP-VERSION=""
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
                    docker build -t ${APP-NAME}:${APP-VERSION}
                """
            }
        }

        stage("Push to ECR"){
            steps{
                sh """
                    # add repo tag
                    docker tag ${APP-NAME}:${APP-VERSION} ${REGISTRY-URI}/${APP-NAME}:${APP-VERSION}
                    # push to repo
                    docker push ${REGISTRY-URI}/${APP-NAME}:${APP-VERSION}
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