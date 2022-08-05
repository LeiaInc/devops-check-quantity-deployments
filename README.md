# AWS ECR Delete old images

This repo is a custom action secrets, this can delete old images from AWS ECR

## Parameters
  - eks-name: The EKS Name
  - ecr-name: The ECR Name
  - qtd-deployment: How many deployment in the cluster are acceptably

## How to use
```yaml
- uses: LeiaInc/devops-check-quantity-deployments@v1
  with:
    eks-name: eks-name
    ecr-name: ecr-name
    qtd-deployment: 5
```

Obs: It's necessary to pass the AWS Access key and AWS Secret Key to environment.

```yaml
- uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ...
    aws-secret-access-key: ...
    aws-region: ...
- uses: LeiaInc/devops-check-quantity-deployments@v1
  with:
    eks-name: eks-name
    ecr-name: ecr-name
    qtd-deployment: 5
```
