```sh
ansible-playbook -i inventory.ini  playbooks/roles/k8s-deploy.yaml -t jumpbox --extra-vars "cleanup=false"
```

This playbook will produce the following binary tree


```sh
k8s@hard-k8s-jumpbox:~/downloads$ tree
.
├── client
│   ├── etcdctl
│   └── kubectl
├── cni-plugins
│   ├── LICENSE
│   ├── README.md
│   ├── bandwidth
│   ├── bridge
│   ├── dhcp
│   ├── dummy
│   ├── firewall
│   ├── host-device
│   ├── host-local
│   ├── ipvlan
│   ├── loopback
│   ├── macvlan
│   ├── portmap
│   ├── ptp
│   ├── sbr
│   ├── static
│   ├── tap
│   ├── tuning
│   ├── vlan
│   └── vrf
├── controller
│   ├── etcd
│   ├── kube-apiserver
│   ├── kube-controller-manager
│   └── kube-scheduler
└── worker
    ├── containerd
    ├── containerd-shim-runc-v2
    ├── containerd-stress
    ├── crictl
    ├── ctr
    ├── kube-proxy
    ├── kubelet
    └── runc
```

And allow you to run kubectl on the jumpbox 

```sh
k8s@hard-k8s-jumpbox:~$ kubectl version
Client Version: v1.32.3
Kustomize Version: v5.5.0
```