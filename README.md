- This repo is the GitOps environment promotion layer. The application Helm chart is packaged and published by the app repo, while this repo keeps the Argo CD Applications that select the chart version per environment.
- The app chart is published to GHCR as `ghcr.io/mohamedsamirspot/microservices-app:<chart-version>`.
- Chart versions are selected here through the Argo CD Application `targetRevision` field. Promotion automation can be added later to update dev directly and open pull requests for prod.
- Argo CD Image Updater is not used for this app release flow because it tracks container image tags, not Helm chart versions. Stakater Reloader can still watch runtime ConfigMaps and Secrets.
## How to install the root app
- Disclaimer: This has to be done only once during the lifetime of the cluster. So basically this is the very initial bootstrapping that should never have to be repeated.
- You need to create it manually through the gui or terraform (root-app-of-apps.yaml)
