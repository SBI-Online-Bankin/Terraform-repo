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
        choice(name: 'Stage_to_Run', choices: [ 'All', 'Init', 'Plan', 'Apply'])
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
            when{
                anyOf{
                    expression {params.Stage_to_Run == 'All'}
                    expression {params.Stage_to_Run == 'Init'}
                }
            }
            steps{
                sh '''
                cd VPC
                terraform init
                '''
            }
        }
        stage('Plan'){
            when{
                anyOf{
                    expression{params.Stage_to_Run == 'All'}
                    expression {params.Stage_to_Run == 'Plan'}
                }
            }
            steps{
                sh """
                """
            }
        }
        stage('Apply'){
            when{
                anyOf{
                    expression {params.Stage_to_Run == 'All'}
                    expression {params.Stage_to_Run== 'Apply'}
                }
            }
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