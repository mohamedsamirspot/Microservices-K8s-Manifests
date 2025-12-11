From the arogcd side we have the argocd image updater installed and tracking this repo and the container registery and also stakater reloader that keeps tracking the configmaps and secrets to restart the deployments accordingly
## How to install the root app
- Disclaimer: This has to be done only once during the lifetime of the cluster. So basically this is the very initial bootstrapping that should never have to be repeated.
- You need to create it manually through the gui or terraform (root-app-of-apps.yaml)
## Argocd Image Updater Installation (in the cluster that contains argocd installed)
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm install argocd-image-updater argo/argocd-image-updater \
  -n argocd \
  -f values.yaml
```

## Stakater Reloader Installation (in the target cluster)
https://github.com/stakater/Reloader
```bash
helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update
helm install reloader stakater/reloader --namespace stakater --create-namespace
```