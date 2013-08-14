About project
===========================

Concepts
===========================
**modules**
* module is a folder in project $project-folder
* main file of module have the same

**plugins**
- plugin is a file in $project-folder/plugins

**user-data**

tags: store personal-data, security, home-dir, user-data with sudo,   

each login has its own personal data, data is protected
```bash
# user-data store at ~/.centos-apps/$module/$name
# should be accessed via apis:
user-store-get name value 
user-store-set name value
user-store-del name
```

**project apis**

common apis for modules

```bash
project-dir-get
module-dir-get
bash-dir-get
```

Structure and Convention
===========================


- no extension
- template

<pre>
#! /bin/bash
# description: install nginx engine from repo
# author: damphat
# requires: rhel-repo
# params: param-a param-b

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

bash script here.

</pre>

<pre>

[nginx]
   nginx
   [plugins]
       install
       is-installed
       remove
       vhost-add-proxy
       vhost-add-fastcgi
       vhost-remove

[module]
    module
    [plugins]

</pre>
