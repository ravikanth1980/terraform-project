#!/bin/bash

sudo su

#Disable swap space
sudo swapoff -a

#Disable SELinux
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

#install the traffic control utility package
sudo dnf install -y iproute-tc

sudo yum install firewalld -y
sudo service firewalld start
#Allow firewall rules for k8s
sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=2379-2380/tcp
sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=10251/tcp
sudo firewall-cmd --permanent --add-port=10252/tcp
sudo firewall-cmd --permanent --add-port=30000-32767/tcp
sudo firewall-cmd --reload

#Install CRI-O container runtime
cat > /etc/modules-load.d/k8s.conf << EOF
overlay
br_netfilter
EOF

#load both modules using the modprobe command
sudo modprobe overlay s
sudo modprobe br_netfilter
#configure the required sysctl parameters as follows
cat > /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF


#confirm the changes have been applied, run the command
sudo sysctl --system
#install CRI-O version
export VERSION=1.28
export OS=CentOS_8

sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/devel:/kubic:/libcontainers:/stable.repo

sudo curl -L -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/devel:kubic:libcontainers:stable:cri-o:$VERSION.repo


sudo yum install cri-o -y

sudo systemctl enable crio

sudo systemctl start crio


#Add the Kubernetes repo
cat <<EOF | tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/repodata/repomd.xml.key
EOF
#install k8s package
sudo dnf install -y kubelet-1.28.2 kubeadm-1.28.2 kubectl-1.28.2 --disableexcludes=kubernetes
sudo systemctl enable kubelet
sudo systemctl start kubelet

#Create a control-plane Master with kubeadm
kubeadm init --pod-network-cidr=10.244.0.0/16

#To start using your cluster
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

#Install Calico Pod Network Add-on [only on Master node]
sudo curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/canal.yaml -O
kubectl apply -f canal.yaml

## TO Install the Docker using the rpm repository
#Set up the repository
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
#Install Docker Engine
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
#Start Docker.
sudo systemctl start docker