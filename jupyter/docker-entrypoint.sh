#!/bin/bash

sudo chown -R gitpod:gitpod /home/gitpod
sudo chmod o+rwx /usr/share/

pip install -e /home/gitpod/src
jupyter labextension develop --overwrite /home/gitpod/src
cd /home/gitpod/src && jlpm run build
rm -rf /home/gitpod/.local/share/jupyter/labextensions/jupyterlab-slurm/
ln -s src/jupyterlab_slurm/labextension /home/gitpod/.local/share/jupyter/labextensions/jupyterlab-slurm


sudo service munge start

tail -f /dev/null
