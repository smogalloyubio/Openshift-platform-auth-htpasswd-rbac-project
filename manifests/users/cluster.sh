#!/bin/bash

echo "Exporting OAuth cluster configuration..."

oc get oauth cluster -o yaml > oauth.yaml

echo "OAuth config saved to oauth.yaml"
echo "Now edit the file manually and re-apply using: oc apply -f oauth.yaml"