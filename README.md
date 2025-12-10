From the arogcd side we have the argocd image updater installed and tracking this repo and the container registery and also stakater reloader that keeps tracking the configmaps and secrets to restart the deployments accordingly
## The only thing that you need to create manually or through terraform is the root-app-of-apps.yaml
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