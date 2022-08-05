#!/bin/sh

EKS_NAME=$1
ECR_NAME=$2
QTD=$3

aws eks update-kubeconfig --name "${EKS_NAME}"

REPO_COUNT=$(kubectl get pods -A --template '{{range.items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep "${ECR_NAME}" -c)

echo "$REPO_COUNT"

if [ "$REPO_COUNT" -ge "$QTD" ];
then
  echo "ERROR: You should have less than {$QTD} apps deployed to deploy a new branch or commit.
  Branch deploy failure. Please delete old or uneeded branches from your repository via Github."
  exit 1
else
  echo "OK: Deploying ${REPO_COUNT} app now..."
fi

echo "##[set-output name=lowercase;]$(echo "${REPO_COUNT}" | tr '[:upper:]' '[:lower:]')"
