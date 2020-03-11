#!/bin/bash
sudo scp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl delete pod app-pod
kubectl apply -f /home/k8s-admin/k8/app-pod.yml
