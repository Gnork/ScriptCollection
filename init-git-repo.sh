#!/bin/bash

if [ -z ${1} ]; then
    echo "ERROR: name of new repository must be specified as first argument"
    exit 1
fi

user=$(whoami)

if [ ! -d /home/${user} ]; then
    echo "ERROR: user does not have home directory at /home/${user}"
fi

if [ ! -d /home/${user}/git ]; then
    mkdir /home/${user}/git
fi

if [ -d /home/${user}/git/${1}.git ]; then
    echo "ERROR: repository with name ${1} already exists"
    exit 1
fi

mkdir /home/${user}/git/${1}.git
cd /home/${user}/git/${1}.git

git init --bare

host=$(cat /etc/hostname)

link="${user}@${host}:/home/${user}/git/${1}.git"

temp=$(mktemp -d)
cd ${temp}

git clone /home/${user}/git/${1}.git
cd ${1}

touch .gitignore
git add --all
git commit -m "init"
git push

cd /home/${user}

if [ -d ${temp} ]; then
    rm -rf ${temp}
fi

echo ""
echo "Your new repository is ready:"
echo "git clone ${link}"
