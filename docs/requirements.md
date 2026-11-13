# AI Knowledge Assistant — Learning Project

## Objective

Build an assistant that answers questions using a small collection
of approved sample IT documents.

## Initial user
One user: the project owner.

## Example questions
- What approvals are required before a firewall change?
- What information must a change request contain?
- When should an incident be escalated?

## Required behaviour
- Answer using the supplied documents.
- Show supporting document references.
- State clearly when the documents do not contain the answer.
- Do not perform infrastructure or operational changes.

## Initial scope
- Non-sensitive sample documents only.
- Browser-based interface.
- Terraform for AWS infrastructure.
- Ansible for application-server configuration.
- London Region preferred.
- No public inbound application access initially.

## Out of scope
- Production company information.
- SharePoint, ServiceNow, or SAP integration.
- Multiple user groups with different document permissions.
- Autonomous actions.

## Success criteria
- A user can ask questions through the interface.
- Answers are supported by the uploaded documents.
- Unsupported questions are handled honestly.
- Infrastructure can be redeployed and removed.