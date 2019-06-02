#!/bin/bash

if  [[ $TRAVIS_PULL_REQUEST = "false" ]]
then
      ip a
#     ncftp -u "$USERNAME" -p "$PASSWORD" "$HOST"<<EOF
#     rm -rf site
#     echo "remove site folder"
#     mkdir site
#     echo "Create site folder"
#     quit
# EOF

#     cd _site || exit
#     echo "copy file "
#     ncftpput -R -v -u "$USERNAME" -p "$PASSWORD" "$HOST" site .
fi
