pipeline{

    agent any

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
        stage('Init'){
            steps{
                sh '''
                ls -lrt
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