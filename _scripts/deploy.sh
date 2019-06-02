#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    ssh wqjrzolc@treebeard.node.idc.wiki <<EOF
    rm -rf /home/wqjrzolc/gdgxian.org/*
    touch /home/wqjrzolc/gdgxian.org/.htaccess
    echo "
      <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{HTTPS} off
            RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
      </IfModule>
      " > .htaccess
EOF

    echo "==== copy file ===="
    rsync -r --delete-after --quiet _site/ wqjrzolc@treebeard.node.idc.wiki:/home/wqjrzolc/gdgxian.org/
fi
