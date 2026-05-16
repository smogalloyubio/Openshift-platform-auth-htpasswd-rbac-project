#!/bin/bash




sudo apt install apache2-utils -y

echo " htpasswd is installed successfully"


echo "Creating HTPasswd file with users admin and developer"
htpasswd -c -B  -b users.htpasswd  john-dev admin
htpasswd -B -b users.htpasswd sara-qa admin 
htpasswd -B -b users.htpasswd emma-edit admin
htpasswd -B -b users.htpasswd mike-devop admin

echo "HTPasswd file created successfully"


echo "Creating Kubernetes secret for HTPasswd file"
oc create secret generic users-secret --from-file=htpasswd=users.htpasswd -n openshift-config

echo "Kubernetes secret created successfully"

echo " check the secret in openshift-config namespace"

oc get secret users-secret -n openshift-config -o yaml

oc  get secret/users-secret -n openshift-config --to=-

