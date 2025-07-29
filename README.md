# ansible-k8s-the-hard-way
## tl;dr
1. Set IPs of your machines in inventory.ini
2. Download ansible collection dependencies with `ansible-galaxy collection install -r requirements.yaml`
3. Run command `ansible-playbook -i inventory.ini  playbooks/roles/k8s-deploy.yaml`

## Description
This repository was for me for a challenge of setting up k8s-the-hard-way with Ansible
The `jumpbox` machine is never used to run `scp` command. Instead, I used `fetch` ansible module with `flat: true` parameter, and then copied the files to the corresponding virtual machines. 

I tried to do as much as I can using Ansible modules, and not use shell, but sometimes, like with `openssl`, `ipconfig` it's far easier to do it in shell

```
k8s@server:~$ etcdctl get /registry/secrets/default/kubernetes-the-hard-way | hexdump -C
00000000  2f 72 65 67 69 73 74 72  79 2f 73 65 63 72 65 74  |/registry/secret|
00000010  73 2f 64 65 66 61 75 6c  74 2f 6b 75 62 65 72 6e  |s/default/kubern|
00000020  65 74 65 73 2d 74 68 65  2d 68 61 72 64 2d 77 61  |etes-the-hard-wa|
00000030  79 0a 6b 38 73 3a 65 6e  63 3a 61 65 73 63 62 63  |y.k8s:enc:aescbc|
00000040  3a 76 31 3a 6b 65 79 31  3a 51 97 b4 77 a0 5c 49  |:v1:key1:Q..w.\I|
00000050  9d 84 70 ab e2 e6 7c c4  88 b1 90 f5 0d 31 67 f8  |..p...|......1g.|
00000060  80 88 fb 8e d2 ae df e5  1b b4 b7 4f 7d c8 dd 91  |...........O}...|
00000070  05 3e 38 62 3f 43 a3 7a  c8 79 a5 b2 bc 7b 14 9b  |.>8b?C.z.y...{..|
00000080  52 e4 16 8b 7c 2f ff c3  56 ae 3d e7 64 84 20 23  |R...|/..V.=.d. #|
00000090  5d 03 ca 68 85 76 89 1c  bd 05 25 7b ec e0 80 d3  |]..h.v....%{....|
000000a0  92 ce bb dc 5c 70 cc 1d  95 25 59 6f 16 e7 8e ee  |....\p...%Yo....|
000000b0  a6 ea 3c 8a 0b 87 f4 6c  8b 3a 2c 06 ff 25 3f 4e  |..<....l.:,..%?N|
000000c0  36 e2 99 e9 47 3e e4 0c  d0 79 1f 2f b2 1e 87 3c  |6...G>...y./...<|
000000d0  ff 36 6e 47 d6 19 6a 13  99 9f 10 5e 0b 96 6c 8f  |.6nG..j....^..l.|
000000e0  5e af c7 47 32 3d 31 8f  1d 43 1f 14 d4 0c cf e3  |^..G2=1..C......|
000000f0  13 f1 e5 0d ff dd b5 1f  54 40 a2 3d 0c 76 38 db  |........T@.=.v8.|
00000100  5f 8c fe 05 5c 3d 71 e0  01 1f b5 69 04 4b d5 b8  |_...\=q....i.K..|
00000110  be 69 e7 c2 90 d3 d6 c3  f1 05 a5 a0 4e 50 48 61  |.i..........NPHa|
00000120  5c 1d b3 a3 87 d2 c6 4e  42 5e d3 70 20 80 76 9b  |\......NB^.p .v.|
00000130  6b 85 35 fe 09 94 d6 c3  5c 9a 25 6d 92 b0 f3 95  |k.5.....\.%m....|
00000140  ee 15 a4 c6 bc 04 85 36  97 9c a2 2a 92 0a d7 7b  |.......6...*...{|
00000150  04 a3 11 8d 73 ac fe bd  c7 0a                    |....s.....|
0000015a
```

```
k8s@hard-k8s-jumpbox:~$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-669f67b79f-qv8jf   1/1     Running   0          11m

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.0.0.1     <none>        443/TCP   3h30m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           48m

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-54c98b4f84   0         0         0       48m
replicaset.apps/nginx-669f67b79f   1         1         1       11m
```