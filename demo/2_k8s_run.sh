#!/bin/bash -v

kubectl create namespace demo;
kubectl create deployment coffee-service --image=sbishyr/coffee-service:1.0 -n demo;
