sudo rm -rf /var/lib/etcd
sudo rm -rf /etc/kubernetes
sudo rm -rf $HOME/.kube/config
sudo kubeadm reset
read -p 'Kubernetes IP Address, followed by [ENTER]: ' IP
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$IP
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/calico.yaml
kubectl taint nodes — all node-role.kubernetes.io/control-plane-
