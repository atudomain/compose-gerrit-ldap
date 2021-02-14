#!/usr/bin/env bash

usage() {
    cat << EOF
Usage:

user-add.sh GIVENNAME SURNAME USERNAME PASSWORD

Example:

user-add.sh John Snow john.snow winter_is_coming

EOF
}

if [[ $# -eq 0 ]] ; then
    usage
    exit 0
fi

if [[ ( $# == "--help") ||  $# == "-h" ]] 
then 
    usage
    exit 0
fi

GIVENNAME=$1
SURNAME=$2
USERNAME=$3
PASSWORD=$4

MD5PASSWORD=$(slappasswd -h {MD5} -s $PASSWORD)

ldapadd -x -D "cn=admin,dc=example,dc=org" -w Secret123 -H ldap://127.0.0.1:389 << EOF
version: 1
dn: cn=${USERNAME},dc=example,dc=org
cn: ${USERNAME}
givenname: ${GIVENNAME}
mail: ${USERNAME}@example.org
objectclass: inetOrgPerson
objectclass: top
sn: ${SURNAME}
uid: ${USERNAME}
userpassword: ${MD5PASSWORD}
EOF
