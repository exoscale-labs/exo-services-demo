#!/bin/bash
sudo apt update
sudo apt install -y ansible unzip
cd /tmp
wget https://github.com/exoscale-labs/exo-services-demo/archive/refs/heads/master.zip
unzip /tmp/master.zip
cp /tmp/exo-services-demo-master/cloud-init/playbooks/prometheus/inventory/prometheus-demo /tmp
ansible-playbook -i /tmp/"${inventory}" /tmp/exo-services-demo-master/cloud-init/playbooks/prometheus/playbook-prometheus.yml -u ubuntu --tags "${tags}" --connection=local