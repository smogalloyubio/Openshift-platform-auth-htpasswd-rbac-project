 gi#!/bin/bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 USERNAME PASSWORD"
  exit 1
fi

USERNAME="$1"
PASSWORD="$2"

htpasswd -Bbn "$USERNAME" "$PASSWORD" > manifests/users/htpasswd-secret.yaml

echo "Created htpasswd entry for $USERNAME in manifests/users/htpasswd-secret.yaml"
