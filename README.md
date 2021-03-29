# Preview Environments

This collection of repositories is a demo, as well as starting point, for a preview environments setup on top of Spacelift. It features a declarative, VCS-driven, very flexible, infa-as-code like approach which embraces the philosophy of managing Spacelift with Spacelift itself.

Whether you need per Pull Request development environments, QA environments created on demand, or any other form of dynamically allocated environment, the approach represented here will be able to cover all of them. Most imaginable preview environment lifecycles should be achievable with this setup.

No matter if your preview environment comprises a single Stack, or a hundred, a single microservice, or a hundred, including queues, databases, and other accompanying infrastructure, you'll be able to adapt the solution presented here to suit your needs.

The best way to get an overview is to watch the demo video: https://www.loom.com/share/a3427a529eb74b97994668fabc71b969

You can also look at the Pull Requests on the [Service](https://github.com/spacelift-io/demo-preview-environments-service/pulls) and [Infra](https://github.com/spacelift-io/demo-preview-environments-infra/pulls) repositories to see the existing preview environments and play with them, i.e. *curl*ing https://475ed74.hello-service.preview-environments.liftspace.net/hello

# Birds-eye view

The described setup is one of the more conceptually complex ones, with separate repositories describing the artifact for a microservice, and the infrastructure which hosts this artifact.

Preview environments are created for all Pull Requests in the Service and Infra repositories, are kept up to date with changes to those Pull Requests, and get cleaned up after Pull Request deletion.

The following repositories are used:
- [Service](https://github.com/spacelift-io/demo-preview-environments-service) - AWS Lambda representing our application code, the resulting artifact is a zipfile in S3.
- [Infra](https://github.com/spacelift-io/demo-preview-environments-infra) - Sets up all the AWS resources the AWS Lambda needs, including the Lambda itself as well as API Gateway resources.
- [Manager](https://github.com/spacelift-io/demo-preview-environments-manager) - Manages resources representing preview environments. Acts as a repository for all existing preview environments.
- [Setup](https://github.com/spacelift-io/demo-preview-environments-setup) - Sets up the manager, with all its environment variables and policies.
- [Update File Action](https://github.com/spacelift-io/update-file-action) - Can be used to create/update/delete files in a different repository. The Service and Infra repository workflows use this to create preview environments in the Manager repository.

# Detailed Descriptions

## Manager
The root of the manager repository contains one directory per service, for which preview environments are created. In this case, there's one directory, `hello-service`, which is a module instantiated by the `main.tf` file.

Looking at the hello-service directory we can see multiple things:
- `policies` - Fixtures for policies used by preview environment Stacks.
- `template` - Describes a single hello-service preview environment as a Terraform module. In this case this is a single Spacelift Stack with accompanying environment variables, though you could easily extend this to be i.e. multiple Stacks connected by Trigger Policies. This Stack also has a `spacelift_stack_destructor` attached, which will make sure to destroy all resources of this Stack before deleting it. This way all resources of a preview environment are cleaned up on deletion.
- `environments` - List of active preview environments, one file per preview environment. Each file is just an instantiation of the `template` module.
- `main.tf` - Creates dependencies common to all preview environments, in this case it creates record for the wildcard domain name `*.hello-service.preview-environments.liftspace.net`. Each preview environments AWS Lambda will be accessible through this URL, with the environment ID in place of the wildcard.

For each preview environment there are multiple variables which need to be specified, with the interesting being:
- `code_version` - The version of the artifact zipfile to use.
- `environment` - The ID of the preview environment. Should be reasonably unique. In this case we'll be using 8 character prefixes of the hash of the creator repositories owner, name and pull request number.
- `infra_repository_branch` - Which branch of the infra repo to base the preview environment Stack on. The Stacks also have a Push Policy attached to ignore any other branches, so that they don't create any proposed changes.

The manager Stack based on this repository also has an interesting Trigger Policy attached:
```rego
trigger[stack.id] {
    change := input.run.changes[_]
    change.phase == "apply"
    change.entity.type == "spacelift_environment_variable"
    stack := input.stacks[_]
    sanitized(stack.id) == change.entity.data.values.stack_id
}
```
Whenever it finishes execution, it will trigger any stacks it controls, for which environment variables have been changed. This way, if only the `code_version` for a preview environment changes, which only results in an environment variable change, the Stack representing this preview environment will be triggered.

## Service
The service is code for an AWS Lambda responding with Hello World and the current commit SHA.

Whenever a commit to a non-master branch is pushed, it creates a zipfile with the source code, and uploads it to an S3 bucket with the object name being <commit_sha>.zip.

Whenever a commit to the master branch is pushed, it does the same, but uploads the resulting artifact as latest.zip.

For each PR, it will create a file in the `hello-service/environments` directory, with the `code_version` filled with the head commit SHA of the Pull Request, and the `infra_repository_branch` filled with `master`. It updates the files on each commit added to the PR, and deletes the file when the Pull Request is closed.

## Infra
The infra repository creates the actual AWS Lambda and API Gateway resources.

For each PR, it will create a file in the `hello-service/environments` directory, with the `code_version` filled with `latest`, and the `infra_repository_branch` filled with the source branch of the PR. It updates the files on each commit added to the PR, and deletes the file when the Pull Request is closed.

## Setup
This just creates the manager Stack with the required Trigger Policy attached.

## Update File Action
You can use this action to operate on files in a different repository. A GitHub token with suitable permissions has to be provided.

# Usage
You can copy all those repositories to your organization and create a Stack based on the Setup repository to get started.

