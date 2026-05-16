#!/bin/bash
echo " create clusterrolebinding for devop-team in devop-project"
oc create clusterrolebinding devop-team-admin --clusterrole=admin --group=devop-team
oc create clusterrolebinding devop-team-admin --clusterrole=admin --group=devop-team
oc create  clusterrolebinding developer-clusterrolebinding --clusterrole=view --group=developer
oc create clusterrolebinding qa-team-clusterrolebinding --clusterrole=view --group=qa-team
oc create clusterrolebinding auditor-clusterrolebinding --clusterrole=view --group=auditor
oc create clusterrolebinding devop-team-clusterrolebinding --clusterrole=cluster-admin --user=mike-devop



echo " clusterrolebining is created successfully"