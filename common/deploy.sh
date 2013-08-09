#deploy http://github.com/damphat/damphat.git *.damphat.com 3002
set -x
trap read debug

DIR=$(cd "$(dirname "${SOURCE_BASH[0]}")" && pwd)
PROJ_GIT=$1
PROJ_NAME=${2//\*/_}
PROJ_DIR=/myprojects/$PROJ_NAME
PROJ_PORT=$3

git clone $PROJ_GIT $PROJ_DIR

$DIR/../nginx/vhost/add-proxy.sh $2 $3
$DIR/../upstart/add-node.sh $PROJ_NAME $3


