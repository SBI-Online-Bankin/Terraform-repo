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
        choice(name: 'Stage_to_Run', choices: [ 'All', 'Init', 'Plan', 'Apply', 'Destroy'])
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
                cd VPC
                terraform plan
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
            input{
                message: "Waiting for approval"
                ok: "Approve"
                submitter: "Shiva Indla"
            }
            steps{
                sh """
                cd VPC
                terraform apply --auto-approve
                """
            }
        }
        stage('Destory'){
            when{
                anyOf{
                    expression {params.Stage_to_Run == 'Destroy'}
                }
            }
            input{
                message "Really want to run destroy"
                ok "Yes Continue"
            }
            steps{
                sh """
                cd VPC
                terraform destroy --auto-approve
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