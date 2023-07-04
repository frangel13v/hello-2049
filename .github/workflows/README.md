# AWS-Deploy

This workflow deploys a Docker image to AWS and launches an EC2 instance making use of a preconfigured launch template. It also retrieves the public IP address of the EC2 instance and comments the IP address in a commit on GitHub.

## Workflow Description

The workflow is triggered when there is a push or a pull request to the `main` or `master` branch.

1. Checkout Code: This step checks out the repository code using the `actions/checkout` action.

2. Login to GitHub Container Registry: This step logs in to the GitHub Container Registry using the provided personal access token (`PERSONAL_ACCESS_TOKEN` secret) to authenticate the Docker login.

3. Build and Push Docker Image: This step builds and tags the Docker image, and then pushes it to the GitHub Container Registry.

4. Set up AWS credentials: This step configures AWS credentials using the AWS access key ID (`AWS_ACCESS_KEY_ID` secret) and secret access key (`AWS_SECRET_ACCESS_KEY` secret) provided.

5. Launch EC2 instance from launch template: This step launches an EC2 instance using the specified launch template (`lt-0d54503baa0a64beb`).

6. Get Instance Information: This step retrieves the public IP address of the launched EC2 instance and sets it as an environment variable.

7. Comment IP address: This step comments the IP address of the EC2 instance in a commit using the `peter-evans/commit-comment` action. It uses the personal access token (`PERSONAL_ACCESS_TOKEN` secret) to authenticate the comment.

8. Echo IP address: This step simply echoes the IP address of the EC2 instance to the workflow log.

## IMPORTANT INFORMATION

The template for this deployment is `lt-0d54503baa0a64beb`. It configures an EC2 instance and uses the 'User Data' in it to install dependencies and run the project.

## Prerequisites


- AWS access key ID and secret access key with appropriate permissions. They're set as secrets in the GitHub repository with the names `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

- Personal access token with the necessary scopes to log in to GitHub Container Registry and comment on commits. Set as a secret in the GitHub repository with the name `PERSONAL_ACCESS_TOKEN`.
  - The reason I'm using a PAT and not GITHUB_TOKEN is because I had some unexpected issues using it, so, keep in mind:
  -  **THIS IS NOT GOOD PRACTICE**

- The launch template ID must be (`lt-0d54503baa0a64beb`) if you wish to run this project. This is template version 10.
