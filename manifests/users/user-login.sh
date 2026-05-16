#!/bin/bash 
echo " login  user to cluster using oc login command"
echo " Please use the following command to login to the cluster: oc login -u USERNAME

USERNAME1="john-dev"
USERNAME2="sara-qa"
USERNAME3="emma-edit"
USERNAME4="mike-devop"
PASSWRD="admin"

oc  login -u $USERNAME1 -p $PASSWRD
oc  login -u $USERNAME2 -p $PASSWRD
oc  login -u $USERNAME3 -p $PASSWRD
oc  login -u $USERNAME4 -p $PASSWRD
oc  login -u $USERNAME5 -p $PASSWRD

echo " user login successful. Please verify the login status using: oc whoami"



echo "Now you can proceed with the next steps to assign permissions and apply the OAuth configuration."

oc adm policy add-cluster-role-to-user cluster-admin $USERNAME5
echo "Assigned cluster-admin role to $USERNAME4. Please verify the permissions using: oc get clusterrolebindings | grep $USERNAME5"
oc adm policy add-role-to-user admin $USERNAME4
echo "Assigned admin role to $USERNAME5. Please verify the permissions using: oc get rolebindings -n openshift-config | grep $USERNAME5"
oc adm policy add-role-to-user edit $USERNAME1
oc adm policy add-role-to-user edit $USERNAME2
oc adm policy add-role-to-user view $USERNAME3
