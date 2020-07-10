

``` bash
docker run --rm \
  -e PLUGIN_ARGOCD_SERVER=argocd.example.com \
  -e PLUGIN_AUTH_TOKEN=my_token \
  -e PLUGIN_APPLICATION_NAME=argy \
  -e PLUGIN_REVISION=100 \
  -e PLUGIN_GRPC_WEB=true \
  joshdvir/argocd_sync_helm_revision
```