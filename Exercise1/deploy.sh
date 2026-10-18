#!/usr/bin/env bash
set -e

echo "=== Exercise 1: Deploying Nginx Pod and Service ==="

# Apply Pod manifest or run pod
kubectl apply -f pod.yaml

# Wait for pod to be running
echo "Waiting for hello-k8s pod to be ready..."
kubectl wait --for=condition=Ready pod/hello-k8s --timeout=60s

# Apply Service manifest
kubectl apply -f service.yaml

# Display status
echo "=== Pods ==="
kubectl get pods -o wide

echo "=== Services ==="
kubectl get services -o wide

echo "=== Exercise 1 Completed Successfully ==="