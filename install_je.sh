#!/bin/bash
# install package for jenkins
# hostlist 安装的机器列表ip或者hostname
for i in $hostlist;
do
  ssh @$i "yum install -y nfs-util rpcbind";
done


#挂载nfs 存储 使用pv

mkdir -p /data01/k8s-volume
echo "/data01/k8s-volume *(rw,no_root_squash,sync)" >/etc/exports
systemctl start rpcbind
systemctl enable rpcbind
systemctl enable nfs
systemctl restart nfs


#mount k8s_volume

mkdir -p /data01/k8s_volume
mount -t $ip/data01/k8s_volume /data01/k8s_volume

# mkdir -p /opt/jenkins


# cat /data/k8s/jenkins/secrets/initialAdminPassword
