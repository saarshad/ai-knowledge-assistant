# AI Knowledge Assistant - AWS Learning Project

This repository provisions a secure AWS foundation for an AI-powered
enterprise knowledge assistant using Terraform and Ansible.

## Scope

- Region: eu-west-2 (London)
- Infrastructure provisioning: Terraform
- Server configuration: Ansible
- Initial environment: development
- Cost control: AWS Budgets and CloudWatch billing alarms

## Structure

- terraform/global: shared foundational resources
- terraform/modules: reusable infrastructure modules
- terraform/environments/dev: development environment
- ansible: configuration management and validation
- docs: architecture, runbooks, and decisions