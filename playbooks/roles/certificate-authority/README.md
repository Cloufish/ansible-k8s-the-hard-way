In this task we will be generating certificates for each Kubernetes Component and Kubernetes Admin User

We will not be using scp to copy the certificates. We will use `fetch` to copy certificate to the control node (Where you run your playbooks). And then using `copy`