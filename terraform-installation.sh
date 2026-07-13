
#/bin/bash

userid=$(id -u)
packages=$@

validate_function(){

    if [ $1 -eq 0 ]
    then
        echo "Package $2 is already installed"
    else
        echo "installing $2"
        sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
        sudo dnf install -y $2
    fi
}

for i in $packages
do
    rpm -q $i
    validate_function $? $i
done



