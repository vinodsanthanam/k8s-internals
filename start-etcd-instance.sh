docker run --volume=$PWD/etcd-data:/default.etcd --detach --net=host quay.io/coreos/etcd > etcd-container-id
