# vagrant-k8s-cluster-ubuntu-20.04

size 22  Change Owner B2C PoP or B2B PoP

![size 22  Change Owner B2C PoP or B2B PoP](/png/VLN1Rjiu4BthAmOvxHwyIBpOYn44bPsY20glWwIxU-c5baOM4OfaHT9k-lNxI56sPHUzIQCtCszctem-E2zw7pfLk4eefhlvxIqTPEtRmaiF0zqx-OCNy_a3hLgXTqoRW-QUblCLFPjdCl5n6HyBKNcytQo2ywRZ_cOqb3lM_gQmI2GhQONsTFFul7czCAtM5uRDfU5bUUcp1gGGmHiTkYrOtL5HZFbfzf0oB-Y5lmLsdXgmCObzbKefqlVP0qKs2qflL2bPlRcCoF1jy4XHx7eJBBq4dNkGCNkXP2syDDeLCTBiORLU99XGYdpBr0V5ZZg41uXhafhk_fWdyFqiWf-QyoWaUYOhdEEwO5tde0F9rzOSoDY88s_egoR7YYjFJdGZNPIf-K0zeqqorfJCrs7WdvqH9l4SFHpnT-cabtf7op9-ZW7n55juYfixqgFKa_6w7KFA4q8R7rjG6HMJnqfiRofsZWfy0WsvQtqUolOzDe9aGoADHpfomQB8u8ubfNOVeuCbGD2Ut3ET8LnhWgffowHYAe_XqLy8jdLLB-tGU1HgBbf1rQWdvBMczmD7iuSbXlqRnGXheHgnnRuqUI6EWni6N489vnFEqxsUh6Ro4fE4jdfeQo1K6nt3bddmGaqSNNJyn1YnYCHqpPtGKMHx8ol-kSynprQ2MIHjZVDMoFg4pzkHsIMXE7ej__r8oxGFL9GAjMFxQ9Upkq5ghfKMfAkpLWrHV1j7S-OHXmzJL9TmRuFGi200L2rNRzImS18SfN-Vy2-dMUF49fb3NBPfU-LEZuDAQL5qXtCXK8F3DsHLY3LgQeEXVMQsauE1pQhn0ks2gCM4utxWWdekDkl1vpyXiMyDVQ5dxgMfK_mlM2ShUtP767m7reVMG3LP_mKhXz4Rt0aTE4aeMQ3-J170pderRKQmoeWwXRikyBG0gvwZG0GEKMVeh4xi3WhBia-dCl7y-5WkLcTdi801aLuNBzn4rQ07aolPC4V8_Mm6388w2wNpqQk6WZoRfk7-DvInbsZb9huzFVx-Ax-rq5ZzlAVRWSQ0lO86Y_qQKlm2zKz2bLLbWlQVuWLxUlm977yID07_76mO9d7Is5XrpLv8vKvZmje5dFptSI3GuVG4DhXus5NdsJgQtqQPp_ySJiMGRRtEoR0uiic3T14td82lvuUs-00aVjt_0m00 "size 22  Change Owner B2C PoP or B2B PoP")



<br/>

### On Host (with linux)

<br/>

**kubectl installation:**

```
$ curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
```

# Install Kubernetes Cluster using kubeadm
Follow this documentation to set up a Kubernetes cluster on __Ubuntu 20.04 LTS__.

This documentation guides you in setting up a cluster with one master node and one worker node.

## Assumptions
|Role|FQDN|IP|OS|RAM|CPU|
|----|----|----|----|----|----|
|Master|k8s-master|192.168.50.10|Ubuntu 20.04|2G|2|
|Worker|node-1|192.168.50.11|Ubuntu 20.04|1G|1|


<br/>

    $ sudo vi /etc/hosts

```
#---------------------------------------------------------------------
# Kubernetes cluster
#---------------------------------------------------------------------

192.168.50.10   k8s-master
192.168.50.11  node-1
```



    $ mkdir ~/vagrant-kubernetes-ubuntu-20 && cd ~/vagrant-kubernetes-ubuntu-20

    $ git clone  https://github.com/avijitEn/vagrant-k8s-cluster-ubuntu-20.04.git

    $ cd vagrant

    $ vagrant up

    $ vagrant status
    Current machine states:

   k8s-master                running (virtualbox)
   node-1                    running (virtualbox)

<br/>

### Copy kubernetes config for manage kubernetes cluster remotely

<br/>

    $ mkdir -p ~/.kube

<br/>

    // root password: kubeadmin
    $ scp root@master:/etc/kubernetes/admin.conf ~/.kube/config

<br/>

```
$ kubectl version --short
Client Version: v1.20.6
Server Version: v1.20.6
```

<br/>

```
$ kubectl get nodes
NAME         STATUS   ROLES                  AGE   VERSION
k8s-master   Ready    control-plane,master   23m   v1.20.6
node-1       Ready    <none>                 13m   v1.20.6

```

<br/>

### Get Additional Inforamtion

<br/>

```
$ kubectl get po -n kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-57fc9c76cc-z8z69   1/1     Running   0          12m
calico-node-kmjdc                          1/1     Running   0          7m27s
calico-node-skkvh                          1/1     Running   0          12m
calico-node-skrmb                          1/1     Running   0          119s
coredns-74ff55c5b-9sshg                    1/1     Running   0          12m
coredns-74ff55c5b-cmzq5                    1/1     Running   0          12m
etcd-master                                1/1     Running   0          12m
kube-apiserver-master                      1/1     Running   0          12m
kube-controller-manager-master             1/1     Running   0          12m
kube-proxy-2nvst                           1/1     Running   0          12m
kube-proxy-nvl5m                           1/1     Running   0          7m27s
kube-proxy-ssngv                           1/1     Running   0          119s
kube-scheduler-master                      1/1     Running   0          12m
```

<br/>

```
$ kubectl cluster-info

Kubernetes control plane is running at https://192.168.50.10:6443
KubeDNS is running at https://192.168.50.10:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

```

<br/>

```
$ kubectl get cs
Warning: v1 ComponentStatus is deprecated in v1.19+
NAME                 STATUS      MESSAGE                                                                                       ERROR
scheduler            Unhealthy   Get "http://127.0.0.1:10251/healthz": dial tcp 127.0.0.1:10251: connect: connection refused  
controller-manager   Unhealthy   Get "http://127.0.0.1:10252/healthz": dial tcp 127.0.0.1:10252: connect: connection refused  
etcd-0               Healthy     {"health":"true"}     
```

<br/>


