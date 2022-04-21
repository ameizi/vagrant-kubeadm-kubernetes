#! /bin/bash

# fix vagrant cluster all k8s node INTERNAL-IP is 10.0.2.15
echo KUBELET_EXTRA_ARGS=\"--node-ip=`ip addr show eth1 | grep inet | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}/" | tr -d '/'`\" > /etc/default/kubelet
systemctl daemon-reload
systemctl restart kubelet