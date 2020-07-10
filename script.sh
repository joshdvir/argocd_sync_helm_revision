#!/bin/bash
set -e

if [ -z "$PLUGIN_ARGOCD_SERVER" ]; then
  echo "Missing argocd_server, can't continue, exiting."
  exit 1
fi

if [ -z "$PLUGIN_AUTH_TOKEN" ]; then
  echo "Missing auth_token, can't continue, exiting."
  exit 1
fi

if [ -z "$PLUGIN_APPLICATION_NAME" ]; then
  echo "Missing application_name, can't continue, exiting."
  exit 1
fi

if [ -z "$PLUGIN_REVISION" ]; then
  echo "Missing revision, can't continue, exiting."
  exit 1
fi

if [ -z "$PLUGIN_GRPC_WEB" ]; then
  export PLUGIN_GRPC_WEB=''
else
  export PLUGIN_GRPC_WEB='--grpc-web'
fi

export ARGOCD_SERVER=$PLUGIN_ARGOCD_SERVER
export ARGOCD_AUTH_TOKEN=$PLUGIN_AUTH_TOKEN

curl -sSL -o /usr/local/bin/argocd "https://${ARGOCD_SERVER}/download/argocd-linux-amd64"
chmod +x /usr/local/bin/argocd

argocd app patch "$PLUGIN_APPLICATION_NAME" --patch "{\"spec\": { \"source\": { \"targetRevision\": \"$PLUGIN_REVISION\" }}}" --type merge "$PLUGIN_GRPC_WEB"

argocd app sync "$PLUGIN_APPLICATION_NAME" "$PLUGIN_GRPC_WEB"
argocd app wait "$PLUGIN_APPLICATION_NAME" "$PLUGIN_GRPC_WEB"
