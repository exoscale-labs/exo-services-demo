[monitorserver]
localhost

[nodeservers]
%{ for ip in intances_ips ~}
${ip}
%{ endfor ~}



