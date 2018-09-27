node {
    try {
        def BRANCH_NAME = "master"
        def IMAGE_VERSION = "v-$BUILD_NUMBER"
        def REPO_GIT = "https://github.com/richardsonlima/alpine-mysqlserver-docker.git"
        def REGISTRY_REPO = "richardsonlima/alpine-nginx-php"

        stage("cloning_project") {
                checkout([$class: 'GitSCM',
                    userRemoteConfigs: [[url: "$REPO_GIT"]],
                    branches: [[name: "$BRANCH_NAME"]],
                    credentialsId: '',
                    clean: false,
                    extensions: [[$class: 'SubmoduleOption',
                                    disableSubmodules: false,
                                    parentCredentials: false,
                                    recursiveSubmodules: true,
                                    reference: '',
                                    trackingSubmodules: false]],
                    doGenerateSubmoduleConfigurations: false,
                    submoduleCfg: []
                ])
        }

        stage('container_up') {
            dir(env.WORKSPACE) {
                sh(script: "docker-compose up --build -d")
            }
        }


        stage('container_stop') {
            dir(env.WORKSPACE) {
                sh """
                    for services in `docker-compose config --services`; do
                        docker-compose stop -t1 \$services
                    done
                """
            }
        } 

        stage('push_container_to_registry') {
            //def LOGIN_CMD = sh(script: "aws ecr get-login --profile xxx --no-include-email --region sa-east-1", returnStdout: true)
            dir(env.WORKSPACE) {
                sh """
                    docker build -t $REGISTRY_REPO:$IMAGE_VERSION -f Dockerfile .
                    whoami
                    docker push $REGISTRY_REPO:$IMAGE_VERSION
                """
            }
        }
        
    } catch (error) {
        currentBuild.result = 'FAILURE'
        throw error
    } finally {
        echo "RESULT: ${currentBuild.result}"
    }    
}        
