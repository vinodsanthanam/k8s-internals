This demo needs a Linux runtime - Tested in Ubuntu 18.06
Use sudo su -
create a dir called demo and download the git repo.

Download the binaries needed for the demo - ./download-binaries

Demo Just kubelet
---------------------------------------------
./start-kubelet-with-manifesh-directory

cp simple-manifest.yaml manifests/simple-manifest.yaml

docker ps - Should display the two new containers which were created (nginx, gcr.io infrastructure container for the volume)

rm manifests/simple-manifest.yaml

docker ps - There should be no containers running

Stop the kubelet

Demo Kubelet interacting with API Server
---------------------------------------------
Start the etcd backend data store for API Server
./start-etcd-instance

Start the API server, the shell command passes the etcd server instance
./start-kube-apiserver

Start the kubelet, the shell command passess the api server details via the kube-config file
./start-kubelet-with-apiserver

check the logs to ensure api server and kubelet are running fine, kubelet is able to talk to the api server
You can access kubelet at http://localhost:10250 and the api server can be reached at http://localhost:8080/api/v1/nodes

Send the manifest details as JSON to the api server with curl
./create-in-api-server


Articles to Read
---------------------------------------------
http://kamalmarhubi.com/blog/2015/11/17/kubernetes-from-the-ground-up-the-scheduler/

ifconfig
route
arp
docker network inspect bridge
iptables -t nat -L -v -n
docker inspect -f {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} $1
