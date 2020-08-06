#!/bin/bash

wget https://gist.githubusercontent.com/svet-b/6d2f11b59e5fec4416e65f20bce49cb1/raw/bc9dc7224c509bf7037dc38119720e2d448c888f/add_raspbian_testing_repo.sh
chmod a+x add_raspbian_testing_repo.sh
./add_raspbian_testing_repo.sh

apt update

apt install snapd/testing -y

systemctl stop snapd
mv /var/lib/snapd/state.json /var/lib/snapd/state-old.json
systemctl start snapd


chmod a+x download_install_snaps.sh
./download_install_snaps.sh

chmod a+x connect_snap_interfaces.sh
./connect_snap_interfaces.sh