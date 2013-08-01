DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#==GENERATE SSH KEY
ssh-keygen -f ~/.ssh/id_rsa -N ""

#==COPY MY LAPTOP PUBLIC KEYS (allow my laptop access this server)
echo cp "$DIR/authorized_keys2" ~/.ssh/
cp "$DIR/dell-pc.pub" ~/.ssh/authorized_keys2

#==UPLOAD ID_RSA.PUB to GITHUB (make github accept this server)
echo You may prompted for github password!
curl -u damphat -d "{\"title\":\"damphat.com\", \"key\":\"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys

#==DISABLE USEDNS (make ssh connecting faster)
#turn off using dns 'UseDNS yes' -> 'UseDNS no'
sed -i 's/^[# ]*UseDNS *(yes|no)/UseDNS no/' /etc/ssh/sshd_config
