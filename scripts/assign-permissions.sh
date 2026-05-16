#!/bin/bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 USERNAME PROJECT"
  exit 1
fi

USERNAME="$1"
PROJECT="$2"

oc adm policy add-role-to-user view "$USERNAME" -n "$PROJECT"
oc adm policy add-cluster-role-to-user cluster-admin "$USERNAME"

echo "Assigned view role in $PROJECT and cluster-admin to $USERNAME"
