#!/bin/bash -v

kubectl scale deployment/coffee-service --replicas=3
