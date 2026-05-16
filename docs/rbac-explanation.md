# RBAC Explanation

This project uses OpenShift RBAC and groups to manage access to payment namespaces.

- `Group` maps users to logical teams: `developer`, `qa-team`, `auditor`, and `devop-team`.
- `RoleBinding` grants namespace-scoped permissions such as `edit` and `view`.
- `ClusterRoleBinding` grants cluster-wide permissions, in this case `cluster-admin` for the `devop-team`.

Permissions in this setup:

- `developer` group (`john-dev`) has `edit` access to `payment-dev`.
- `qa-team` group (`sara-qa`) has `edit` access to `payment-test`.
- `auditor` group (`emma-edit`) has `view` access to all payment namespaces.
- `devop-team` (`mike-devop`) has `cluster-admin` access and can manage all projects.
