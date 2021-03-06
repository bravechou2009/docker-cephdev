# TODO:
#  * add way of identifying cephbuilder image tag based on HEAD
#  * if no args given, select ivotron/cephbuilder:jewel
function dmake {
  docker run --rm -ti --privileged \
    -v `which docker`:/usr/bin/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /lib/x86_64-linux-gnu/:/lib/x86_64-linux-gnu/ \
    -v /root/bin \
    -v `pwd`:/ceph "$@"
}

# TODO: figure out how to get networking stuff
function dstart {
  docker run -d \
    --name ceph \
    --net=host \
    --entrypoint=singlenode \
    -v `pwd`/conf:/etc/ceph \
    -e MON_IP=$1 \
    -e CEPH_NETWORK=$2 \
    $3
}
