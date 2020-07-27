#!/bin/bash -e

wget https://gist.githubusercontent.com/svet-b/6d2f11b59e5fec4416e65f20bce49cb1/raw/bc9dc7224c509bf7037dc38119720e2d448c888f/add_raspbian_testing_repo.sh
chmod a+x add_raspbian_testing_repo.sh
./add_raspbian_testing_repo.sh

apt update

apt purge snapd -y
rm -rf /var/cache/snapd
rm -rf /var/lib/snapd

apt install snapd/testing libseccomp2/testing -y

snap install ammp-connect
