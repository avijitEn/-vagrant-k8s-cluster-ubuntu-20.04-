echo "[TASK 2] Initialize Kubernetes Cluster"
#kubeadm init --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null
sudo kubeadm init --apiserver-advertise-address=192.168.50.10 --pod-network-cidr=10.244.0.0/16  --ignore-preflight-errors=all>> /root/kubeinit.log 2>/dev/null

sudo -u vagrant /bin/bash <<\DEVOPS_BLOCK
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "TASK: kubectl autocompletion"
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

source ~/.bashrc
DEVOPS_BLOCK

echo "[TASK 3] Deploy Calico network"
#kubectl create -f https://docs.projectcalico.org/v3.16/manifests/calico.yaml >/dev/null 2>&1
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.16/manifests/calico.yaml
echo "[TASK 4] Generate and save cluster join command to joincluster.sh"
kubeadm token create --print-join-command >/joincluster.sh 2>/dev/null