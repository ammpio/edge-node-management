#!/bin/bash

apt purge snapd -y

wget https://gist.githubusercontent.com/svet-b/6d2f11b59e5fec4416e65f20bce49cb1/raw/bc9dc7224c509bf7037dc38119720e2d448c888f/add_raspbian_testing_repo.sh
chmod a+x add_raspbian_testing_repo.sh
./add_raspbian_testing_repo.sh

rm -rf /var/cache/snapd
rm -rf /var/lib/snapd

apt update
apt install snapd/testing libseccomp2/testing -y

snap install ammp-edge
snap install ammp-connect
snap connect ammp-edge:system-observe
snap connect ammp-edge:hardware-observe
snap connect ammp-edge:log-observe
snap connect ammp-edge:network-observe
snap connect ammp-edge:network-control
