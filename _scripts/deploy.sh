#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    rm _site/travis-ci-deploy
    rm _site/travis-ci-deploy.enc
    echo "==== copy file ===="
    scp -r _site/* foxtjryj@202.95.9.110:/httpdocs/gdgxian.org/
    
    ssh foxtjryj@202.95.9.110 <<EOF
    touch /httpdocs/gdgxian.org/.htaccess
    echo "
      <IfModule mod_rewrite.c>
            RewriteEngine On
            RewriteCond %{HTTPS} off
            RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
      </IfModule>
      " > /httpdocs/gdgxian.org/.htaccess
EOF
fi
