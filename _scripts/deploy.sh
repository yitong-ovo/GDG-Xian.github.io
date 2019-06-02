#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    rm _site/travis-ci-deploy
    rm _site/travis-ci-deploy.enc
    echo "==== copy file ===="
    rsync -r --delete-after --quiet _site/ wqjrzolc@treebeard.node.idc.wiki:/home/wqjrzolc/gdgxian.org/
    
    ssh wqjrzolc@treebeard.node.idc.wiki <<EOF
    touch /home/wqjrzolc/gdgxian.org/.htaccess
    echo "
      <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{HTTPS} off
            RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
      </IfModule>
      " > /home/wqjrzolc/gdgxian.org/.htaccess
EOF
fi
