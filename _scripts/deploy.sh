#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
    rm _site/travis-ci-deploy
    rm _site/travis-ci-deploy.enc
    echo "==== compression files ===="
    zip -r webroot.zip _site/*
    echo "==== file size: $(du -h webroot.zip) ===="
    echo "==== copy file ===="
    scp webroot.zip foxtjryj@202.95.9.110:/
    
    ssh foxtjryj@202.95.9.110 <<EOF
    unzip -o webroot.zip -d /httpdocs/gdgxian.org/
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
