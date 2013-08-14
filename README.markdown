Project Convention
===========================

**modules**
* module is a folder in project $project-folder
* main file of module have the same

**plugins**
- plugin is a file in $project-folder/plugins

**user-data**
- store at ~/.centos-apps/$module/$name
- access via API

**libs**
- internal use: ex 
-- user-store-get name value 
-- user-store-set name value
-- user-store-del name
-- bash-dir-get

**bash-file-conventions**
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
