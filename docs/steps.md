# Deployment Steps

1. Create the namespaces:
   ```bash
   oc apply -f manifests/projects/namespace.yaml
   ```
2. Create the htpasswd secret with your user credentials:
   ```bash
   oc apply -f manifests/users/htpasswd-secret.yaml
   ```
3. Create OpenShift groups for the users:
   ```bash
   oc apply -f manifests/users/groups.yaml
   ```
4. Apply namespace RBAC bindings for the groups:
   ```bash
   oc apply -f manifests/rbac/rolebinding.yaml
   ```
5. Apply the cluster-admin binding for the devop team:
   ```bash
   oc apply -f manifests/rbac/clusterrolebinding.yaml
   ```
