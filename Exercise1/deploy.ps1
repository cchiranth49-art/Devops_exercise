# Exercise 1: Kubernetes Getting Started Deployment Script (PowerShell)
Write-Host "=== Exercise 1: Deploying Nginx Pod and Service ===" -ForegroundColor Cyan

kubectl apply -f pod.yaml
Write-Host "Waiting for hello-k8s pod to reach Ready state..." -ForegroundColor Yellow
kubectl wait --for=condition=Ready pod/hello-k8s --timeout=60s

kubectl apply -f service.yaml

Write-Host "=== Pods ===" -ForegroundColor Green
kubectl get pods -o wide

Write-Host "=== Services ===" -ForegroundColor Green
kubectl get services -o wide

Write-Host "=== Exercise 1 Deployment Completed ===" -ForegroundColor Cyan