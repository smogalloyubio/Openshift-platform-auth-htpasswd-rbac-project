#!/bin/bash 
echo " create project for users"
PROJECTNAME1="payment-dev"
PROJECTNAME2="payment-prod"
PROJECTNAME3="payment-test"

echo "Creating projects: $PROJECTNAME1, $PROJECTNAME2, $PROJECTNAME3"
oc new-project $PROJECTNAME1
oc new-project $PROJECTNAME2
oc new-project $PROJECTNAME3


echo "Projects created successfully. Please verify the projects using: oc get projects"
echo" give permissions to the respective groups for the projects"
oc adm policy add-role-to-group edit developer -n $PROJECTNAME1
oc adm policy add-role-to-group view qa-team -n $PROJECTNAME1
oc adm policy add-role-to-group view editors -n $PROJECTNAME1
oc adm policy add-role-to-group admin devops-team -n $PROJECTNAME1



echo "  add user to the project name payment-dev"
oc adm policy add-role-to-user edit john-dev -n $PROJECTNAME1
oc adm policy add-role-to-user view sara-qa -n $PROJECTNAME3
oc adm policy add-role-to-user view emma-edit -n $PROJECTNAME2
oc adm policy add-role-to-user admin mike-devop -n $PROJECTNAME1


echo "Permissions assigned successfully. Please verify the permissions using: oc get rolebindings -n $PROJECTNAME1, oc get rolebindings -n $PROJECTNAME2, oc get rolebindings -n $PROJECTNAME3"
