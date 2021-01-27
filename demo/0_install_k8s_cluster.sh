#!/bin/bash -v

PROJECT_ID=sincere-nirvana-299317;

# creating k8s cluster on GKE
gcloud container clusters create istio-demo --project=${PROJECT_ID} \
    --machine-type=n1-standard-2 \
    --num-nodes=2 \
    --zone europe-west1-b \
    --no-enable-legacy-authorization;

# add permissions to the GKE user
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user="$(gcloud config get-value core/account)";

# deploy services
kubectl apply -f $COFFEE_UI/coffee-ui.yaml;
kubectl apply -f $COFFEE_SERVICE/kubernetes/coffee-service.yaml;
kubectl apply -f $COFFEE_SERVICE/kubernetes/ingress.yaml;


# clean up k8s deployment
# kubectl delete -f $COFFEE_SERVICE/kubernetes/ingress.yaml
# kubectl delete -f $COFFEE_SERVICE/kubernetes/coffee-service.yaml
# kubectl delete -f $COFFEE_UI/coffee-ui.yaml