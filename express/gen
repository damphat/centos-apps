#!/usr/bin/env bash
set -x
trap read debug

help() {
	echo Tool generate express website
	echo 
	echo Usage: gen \<proj_name\> [proj_domain]
	echo
}

check_dependencies() {
	which npm;
	if [ $? != 0 ]; then
		echo "ERROR need npm package"
		echo "see nodejs/install.sh"
	fi
}

check_folder() {
	if [ "$1" == ""	]; then
		echo "ERROR: folder can not be empty"
		exit 1
	fi
	
	if [ -d "$1" ]; then
		echo "ERROR: folder $1 already exist"
		exit 2
	fi
}

check_domain() {
	if [ "$1" == "" ]; then
		echo "ERROR: domain can not be empty"
		exit 1
	fi
}


if [ $# != 2 ]; then
	help
	exit 0
fi

proj_name=$1
proj_domain=$2

check_dependencies
check_folder $proj_name
check_domain $proj_domain

echo [==CREATE FOLDER ==]
mkdir $proj_name

if [ $? != 0 ]; then
	echo "ERROR: can not create folder $proj_name"
	exit 1
fi

cd $proj_name

echo [==ENSURE INSTALL EXPRESS==]

which express
if [ $? != 0 ]; then 
	npm install -g express
	if [ $? != 0 ]; then
		echo ERROR: npm not found or network problem?
		cd ..
		rm -rf $proj_name
		exit 1
	fi
fi

echo [==GENERATE CODE==]
express -s

echo [==CREATE GIT REPO==]

echo "[--download gitignore for nodejs project--]"
wget https://raw.github.com/github/gitignore/master/Node.gitignore -O .gitignore

echo "[--git init; git add; git commit--]"
git init
git add .
git commit -m"generate project with express -s"

echo [==INSTALL DEPENDENCIES==]
npm install

echo [==PUSH GITHUB==]
echo [--create repository https://github.com/damphat/${proj_name}.git]
curl -u 'damphat' https://api.github.com/user/repos -d "{\"name\":\"${proj_name}\"}"

echo [--set origin--]
git remote add origin https://damphat@github.com/damphat/${proj_name}.git

echo [--push origin--]
git push origin master

echo [==DEPLOY for the first time==]
echo [--copy src to deploy directory--]
# check deploy directory for existing proj_domain
mkdir /myprojects

if [ -d "/myproject/${proj_domain}" ]; then
	echo "ERROR can not deploy because /myproject/${proj_domain} already exist"
	exit 1
fi

mkdir /myprojects/${proj_domain}
git archive master | tar -xC /myprojects/${proj_domain}

echo [--choose available port--]
echo [--create upstart to launch node at the port--]
echo [--add config to nginx proxy to the port--]

echo [==DEPLOY new source code==]
echo [--rename current src dir--]
echo [--deploy new code]
echo [--restart node service $proj_domain--]
