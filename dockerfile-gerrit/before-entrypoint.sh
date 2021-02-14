#!/bin/bash -e

if [ ! -d /var/gerrit/git/All-Projects.git ] || [ "$1" == "init" ]
then
  if [ -f /gerrit.config ]; then
    echo "Initializing Gerrit config ..."
    cp -f /gerrit.config /var/gerrit/etc/gerrit.config
    cp -f /secure.config /var/gerrit/etc/secure.config
  fi
  if [ -f /secure.config ]; then
    echo "Initializing Gerrit secure config ..."
    cp -f /secure.config /var/gerrit/etc/secure.config
  fi
fi

/entrypoint.sh $@
