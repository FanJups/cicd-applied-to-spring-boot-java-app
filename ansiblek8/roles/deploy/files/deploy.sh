#!/bin/bash
sudo scp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf


kubectl get services | grep knote
RESULT=$?
		
if [ $RESULT -eq 0 ]; then
		kubectl delete -f /tmp/deployment/deploy.yml
    kubectl apply -f /tmp/deployment/deploy.yml
	else
		kubectl delete -f /tmp/deployment
		kubectl apply -f /tmp/deployment/
fi




