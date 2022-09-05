#!/bin/bash

sudo rm -rf /home/gitpod/src
sudo cp -R /tmp/src /home/gitpod/
sudo chown -R gitpod:gitpod /home/gitpod
sudo chmod o+rwx /usr/share/

pip install -e /home/gitpod/src
jupyter labextension develop --overwrite /home/gitpod/src
cd /home/gitpod/src && jlpm run build



sudo service munge start

# jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

tail -f /dev/null
