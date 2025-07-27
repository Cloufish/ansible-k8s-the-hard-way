This task will try to Provision other machines in Kubernetes cluster

```sh
ansible-playbook -i inventory.ini  playbooks/roles/k8s-deploy.yaml -t compute-resources --extra-vars "cleanup=false"
```

It should result in following `/etc/hosts`
```sh
# Your system has configured 'manage_etc_hosts' as True.
# As a result, if you wish for changes to this file to persist
# then you will need to either
# a.) make changes to the master file in /etc/cloud/templates/hosts.debian.tmpl
# b.) change or remove the value of 'manage_etc_hosts' in
#     /etc/cloud/cloud.cfg or cloud-config from user-data
#
127.0.1.1 hard-k8s-jumpbox hard-k8s-jumpbox
127.0.0.1 localhost

# The following lines are desirable for IPv6 capable hosts
::1 localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

# BEGIN Kubernetes The Hard Way
# IP ADDRESS                FQDN                 HOSTNAME
192.168.1.171      server.kubernetes.local        server
192.168.1.172      node-0.kubernetes.loca         node-0
192.168.1.173      node-1.kubernetes.local        node-1
# END Kubernetes The Hard Way
```

We won't setup ssh on jumpbox, since we're already using Ansible