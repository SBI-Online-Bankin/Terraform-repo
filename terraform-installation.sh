
#/bin/bash

userid=$(id -u)
packages=$@

validate_function(){

    if [ $1 -eq 0 ]
    then
        echo "Package $2 is already installed"
    else
        echo "installing $2"
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
        sudo yum -y install terraform
}

for i in $packages
do
    rpm -q $i
    validate_function $? $i
done



