#!/bin/bash

wget https://gist.githubusercontent.com/svet-b/6d2f11b59e5fec4416e65f20bce49cb1/raw/bc9dc7224c509bf7037dc38119720e2d448c888f/add_raspbian_testing_repo.sh
chmod a+x add_raspbian_testing_repo.sh
./add_raspbian_testing_repo.sh

apt update

apt install snapd/testing -y

systemctl stop snapd
mv /var/lib/snapd/state.json /var/lib/snapd/state-old.json 
systemctl start snapd

echo "Sleeping 30 seconds, for snapd device initialization"
sleep 30

snap install ammp-connect

# Pass on any command line arguments (like --beta)
snap install ammp-edge $@
snap connect ammp-edge:system-observe
snap connect ammp-edge:hardware-observe
snap connect ammp-edge:log-observe
snap connect ammp-edge:network-observe
snap connect ammp-edge:network-control