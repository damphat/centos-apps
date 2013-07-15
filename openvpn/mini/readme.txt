===Minimum configuration for openvpn===
Step 1: generate static.key (both client and server use the same file)
Step 2: write configuration for server
   server.conf,  direct.damphat.com:100, static.key

Step 3: write configuration for client
   client.ovpn, connect to direct.damphat.com:100, static.key
   note: must use the same static.key with server
   p/s: we use .ovpn instead of .conf because this configuration is tested with windows

