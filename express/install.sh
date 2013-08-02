#CHECK nodejs, npm
which node || $DIR/../nodejs/install.sh
which npm  || $DIR/../nodejs/install.sh

#CHECK express global
which express || npm install -g express
