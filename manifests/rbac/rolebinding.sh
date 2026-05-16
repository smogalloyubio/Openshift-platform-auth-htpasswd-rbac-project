#!/bin/bash 

echo" create rolebinding for devop-team in devop-project"
oc create rolebinding devop-team-admin --clusterrole=admin --group=devop-team -n payment-prod
oc create rolebinding devop-team-admin --clusterrole=admin --group=devop-team -n payment-dev
oc create rolebinding devop-team-admin --clusterrole=admin --group=devop-team -n payment-test



echo " create role for developer group in devop-project"
oc create role developer-role --verb=get,list,watch --resource=pods -n payment-dev
oc create role developer-role --verb=get,list,watch --resource=pods -n payment-test
oc create role developer-role --verb=get,list,watch --resource=pods -n payment-prod



echo " create. rolebining for developer group in devop-project"
oc create rolebinding developer-binding --role=developer-role --group=developer -n payment-dev
oc create rolebinding developer-binding --role=developer-role --group=developer -n payment-test
oc create rolebinding developer-binding --role=developer-role --group=developer -n payment-prod


echo " create role for qa-team group in devop-project"
