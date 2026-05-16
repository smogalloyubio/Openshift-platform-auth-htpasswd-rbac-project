# OpenShift Authentication & RBAC with htpasswd

## Project Overview

This project demonstrates how to set up **user authentication** and **Role-Based Access Control (RBAC)** in OpenShift using the **htpasswd** identity provider.

It includes:
- Creation of users via htpasswd
- Definition of user **Groups** representing different teams
- Namespace-scoped and cluster-wide permissions using **RoleBindings** and **ClusterRoleBindings**
- Best practices for separating development, testing, and auditing access

## Objectives

- Configure **htpasswd** as the identity provider in OpenShift
- Create users and assign them to logical groups
- Implement fine-grained access control for payment-related namespaces
- Demonstrate real-world team-based authorization model

## Architecture / Components

- **Identity Provider**: htpasswd (file-based authentication)
- **Groups**:
  - `developer`
  - `qa-team`
  - `auditor`
  - `devop-team`
- **Namespaces**:
  - `payment-dev`
  - `payment-test`
  - `payment-prod` 

## Users & Groups Mapping

| User          | Group          | Role / Access                          | Namespace(s)          |
|---------------|----------------|----------------------------------------|-----------------------|
| john-dev      | developer      | Edit access                            | payment-dev           |
| sara-qa       | qa-team        | Edit access                            | payment-test          |
| emma-auditor  | auditor        | View-only access                       | All payment namespaces|
| mike-devop    | devop-team     | Cluster-admin (full cluster access)    | All                  |

## RBAC Explanation

This project uses OpenShift RBAC and groups to manage access to payment namespaces.

- `Group` maps users to logical teams: `developer`, `qa-team`, `auditor`, and `devop-team`.
- `RoleBinding` grants namespace-scoped permissions such as `edit` and `view`.
- `ClusterRoleBinding` grants cluster-wide permissions, in this case `cluster-admin` for the `devop-team`.

### Permissions in this setup:

- `developer` group (`john-dev`) has `edit` access to `payment-dev`.
- `qa-team` group (`sara-qa`) has `edit` access to `payment-test`.
- `auditor` group (`emma-auditor`) has `view` access to all payment namespaces.
- `devop-team` (`mike-devop`) has `cluster-admin` access and can manage all projects.

## Prerequisites

- OpenShift cluster (4.10+ recommended)
- `oc` CLI installed and logged in as a cluster-admin
- `htpasswd` utility available

## Setup Instructions

### 1. Create htpasswd File

```
htpasswd -c -B -b users.htpasswd john-dev <password>
htpasswd -B -b users.htpasswd sara-qa <password>
htpasswd -B -b users.htpasswd emma-auditor <password>
htpasswd -B -b users.htpasswd mike-devop <password>
```
### Create Secret in OpenShift
```
oc create secret generic htpasswd-secret \
  --from-file=htpasswd=users.htpasswd \
  -n openshift-config
```
### Configure OAuth with htpasswd Identity Provider
```
apiVersion: config.openshift.io/v1
kind: OAuth
metadata:
  name: cluster
spec:
  identityProviders:
  - name: htpasswd
    mappingMethod: claim
    type: HTPasswd
    htpasswd:
      fileData:
        name: htpasswd-secret
oc apply -f auth.yaml -n openshift-config

```
### Create Payment Namespaces

```
 oc create project payment-dev
oc create project payment-test
oc create project payment-prod
```
### Verification 
```
# Login as each user
oc login -u john-dev -p admin 

# Check permissions
oc auth can-i get pods --as=john-dev -n payment-dev
oc auth can-i create deployment --as=sara-qa -n payment-test
oc auth can-i "*" "*" --as=mike-devop --all-namespaces

```

