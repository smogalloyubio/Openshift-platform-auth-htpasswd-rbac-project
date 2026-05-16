#!/bin/bash 
echo " create group and assign user to teh group"
echo " Please use the following command to create a group and assign users: oc adm groups new
GROUPNAME1=developer 
GROUPNAME2=qa-team 
GROUPNAME3=editors
GROUPNAME4=devops-team

oc adm groups new $GROUPNAME1 
oc adm groups new $GROUPNAME2
oc adm groups new $GROUPNAME3
oc adm groups new $GROUPNAME4


echo "Groups created successfully. Please verify the groups using: oc get groups"



echo "Now assign users to the respective groups using the following commands:"
oc adm groups add-users $GROUPNAME1 john-dev
oc adm groups add-users $GROUPNAME2 sara-qa
oc adm groups add-users $GROUPNAME3 emma-edit
oc adm groups add-users $GROUPNAME4 mike-devop

oc adm groups add-users $GROUPNAME1 mike-devop
oc adm groups add-users $GROUPNAME2 mike-devop
oc adm groups add-users $GROUPNAME3 mike-devop


echo "Users assigned to groups successfully. Please verify the group memberships using: oc describe group $GROUPNAME1, oc describe group $GROUPNAME2, oc describe group $GROUPNAME3, oc describe group $GROUPNAME4"
echo "Now you can proceed with the next steps to assign permissions and apply the OAuth configuration."
oc adm policy add-role-to-group  edit $GROUPNAME1
oc adm policy add-role-to-group view $GROUPNAME2
oc adm policy add-role-to-group view  $GROUPNAME3
oc adm policy add-role-to-group admin $GROUPNAME4



echo " test if teh user can login and access the cluster resources based on the assigned roles and groups"
echo "Please use the following command to login to the cluster: oc login -u USERNAME -p PASSWORD"
echo "After logging in, verify the access permissions using: oc whoami, oc get pods -n openshift-config, oc get projects, etc."
oc   auth can-i  get pods --as=john-dev 
oc   auth can-i  get pods --as=sara-qa
oc   auth can-i  get pods --as=emma-edit
oc   auth can-i  get pods --as=mike-devop


