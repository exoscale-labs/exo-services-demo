# Deploying Monitoring Stack on Exoscale using Terraform 

Monitoring is crucial to measure the performance of applications running in a production environment. 
This Terraform / Ansible project allows you to deploy different Exoscale services (dbaas, sks, ...), but especially a monitoring stack composed of two popular open-source tools: Prometheus and Grafana.

##### Useful commands :
- Terraform init
- Terraform validate
- Terraform plan --out  terraform.plan
- Terraform apply "terraform.plan"
- Terraform destroy

## Monitoring Stack

### Node exporter 

Node exporter is responsible for fetching the statistics from various hardware and virtual resources in the format which Prometheus can understand and with the help of the prometheus server those statistics can be exposed on port 9100.
### Prometheus 

Prometheus is an open-source tool for scrapping the performance metrics of any given hardware resource (CPU, VM, Cloud Virtual Machine, Router, etc.).
The architecture is really scalable and 3rd party libraries makes it more powerful.

### Grafana 

 Grafana is an open-source analytics and visualization tool for viewing the metrics scraped by Prometheus from various resources. 
Grafana does not store any data, but instead, it relies on Prometheus to send the data so that dashboard can be prepared.

## Improvements for Production environments

- Alerting: Monitoring is important, and so is the alerting, it allows administrators to remedy the situation and avoid further issues quickly.
Alertmanager could be a good option: It handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integration such as email, PagerDuty, or OpsGenie. It also takes care of silencing and inhibition of alerts.

- Secrets encryption:   Protecting sensitive content such as passwords or keys rather than leaving it visible as plaintext in playbooks or roles.

- CI/CD pipelines:  For further agility and flexibility.


## Disclaimer

This script example is provided as-is and can be modified freely. Refer to [Exoscale SKS SLA](https://community.exoscale.com/documentation/sks/overview/#service-level-and-support) to understand the limits of Exoscale Support. If you find a bug or have a suggestion/improvement to make
we welcome issues or PR in this repository but take no commitment in integrating/resolving these.
