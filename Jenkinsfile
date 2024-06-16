pipeline {
    agent {
        label 'Agent-1' //config agent in jenkins after creatin server and add the agent name here
    }
    options{
        //how much time does a snapshot need to run? max time? that we will configure here
        timeout(time: 30, unit: 'MINUTES') //we can give mints, hours, seconds etc.. 
        disableConcurrentBuilds() //Next build will wait for the previous build to get completed.
        ansiColor('xterm')
    }
    parameters{ //if frontend(CI) provides below parameter info(which is there in Nexus), i will print it in stage
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'what is the application version number?')
    }
    environment {
        def appVersion = '' //declared variable at env level, this can be used in any stage.
        nexusUrl = 'nexus.devopskk.online:8081' //nexus runs on port 8081 jenkins on 8080
    }
    stages {
        stage('Print the version') {
            steps {
                script{ //grovy script so code need to be in script {}
                echo "Application version: ${params.appVersion}"
                }
            }
        }
        stage('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init
                """    
            }
        }
        stage('plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """    
            }
        }
        stage('Deploy') {
            steps {
                sh """
                    cd terraform
                    terraform plan
                """    
            }
        }
        stage('Deploy') {
            steps {
                sh """
                    cd terraform
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """    
            }
        }
    }
    post {//we have many posts,below are 3 among them. so posts run after build.used for trigging mails about status etc
        always { 
            echo 'the steps we write here will always run after any build'
            deleteDir()    //this deletes the build files after build in directory. otherwise memory waste
        }
        success { 
            echo 'the steps we write here will run after only success build'
        }
        failure { 
            echo 'the steps we write here will run after only failure build'
        }
    }
}