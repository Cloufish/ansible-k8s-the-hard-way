ansible-playbook -i inventory.ini  playbooks/roles/k8s-deploy.yaml -t jumpbox --extra-vars "cleanup=false"
