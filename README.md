

``` bash
docker run --rm \
  -e PLUGIN_ARGOCD_SERVER=argocd.example.com \
  -e PLUGIN_AUTH_TOKEN=my_token \
  -e ARGOCD_APPLICATION_NAME=argy \
  joshdvir/argocd_sync_helm_revision
```