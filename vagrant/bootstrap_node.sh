#echo "[TASK 1] Join node to Kubernetes Cluster"

sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no k8s-master:/joincluster.sh /joincluster.sh 2>/dev/null

bash /joincluster.sh
