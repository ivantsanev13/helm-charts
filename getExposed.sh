#!/bin/bash

export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services SERVICE-NAME-HOLDER)
export MASTER_NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
export WORKER1_NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[1].status.addresses[0].address}")
export WORKER2_NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[2].status.addresses[0].address}")
echo http://$MASTER_NODE_IP:$NODE_PORT
echo http://$WORKER1_NODE_IP:$NODE_PORT
echo http://$WORKER2_NODE_IP:$NODE_PORT
