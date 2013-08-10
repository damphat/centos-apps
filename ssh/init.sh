DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#==GENERATE SSH KEY
ssh-keygen -f ~/.ssh/id_rsa -N ""

#==COPY MY LAPTOP(dell-pc) PUBLIC KEYS to THIS SERVER (allow my laptop access this server)
#cp "$DIR/dell-pc.pub" ~/.ssh/authorized_keys2

#==UPLOAD ID_RSA.PUB to GITHUB (make github accept this server)
$DIR/../github/github add-ssh-key "$(hostname) $(whoami)" "$(cat ~/.ssh/id_rsa.pub)"

#==DISABLE USEDNS (make ssh connecting faster)
#turn off using dns 'UseDNS yes' -> 'UseDNS no'
sed -i 's/^[# ]*UseDNS *(yes|no)/UseDNS no/' /etc/ssh/sshd_config
