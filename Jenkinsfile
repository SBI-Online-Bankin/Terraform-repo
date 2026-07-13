pipeline{

    agent {
        label 'Agent-1'
    }

    options{

        disableConcurrentBuilds()
    }

    environment{
        greetings = 'Good Morning'
    }
    parameters{

        string(name:'package', defaultValue:'git', description:'type the package name')
    }
    stages{
        stage('install terraform'){
            steps{
                sh """
                sudo su -
                chmod +x terraform-installation.sh
                ./terraform-installation.sh ${params.package}
                """
            }
        }
        stage('Init'){
            steps{
                sh '''
                cd VPC
                terraform init
                '''
            }
        }
        stage('Plan'){
            steps{
                sh """
                """
            }
        }
        stage('Apply'){
            steps{
                sh """
                """
            }
        }
    }
    post{
        always{
            echo "i will say hellow always"
        }
        success{
            echo "i will say hellow when success"
        }
        failure{
            echo "i will say hellow when fails"
        }
    }
}