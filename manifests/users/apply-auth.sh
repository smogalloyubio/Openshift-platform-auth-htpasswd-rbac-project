#!/bin/bash 
 oc  replace -f oauth.yaml 

 echo "OAuth configuration applied successfully. Please verify the changes using: oc get oauth cluster -o yaml"
 echo " check if the  pods in openshift-authentication namespace are running successfully"
 oc get pods -n openshift-authentication
 echo " restart the pods in openshift-authentication namespace to apply the changes"
 oc  rollout restart deployment -n openshift-authentication --all
echo "All pods in openshift-authentication namespace have been restarted. Please check their status again"
 oc get pods -n openshift-authentication
 