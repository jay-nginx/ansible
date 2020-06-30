# Environment Set-up
VM1 - Ansible Host
VM2 - Target Machine / NGINX Gateway

VM1 - Checks
- Ensure you can 'ssh root@<ip_vm2>' without password
- Ensure you can 'ssh root@<ip_vm1>' without password on the same box
- Ensure you you have latest version of Ansible installed (2.9 or greater)
- Install relevant Roles for running the tasks / ansible-galaxy install <role_name>
    - nginxinc.nginx
    - nginxinc.nginx_controller_agent
    - nginxinc.nginx_controller_gateway
- Ensure you have cloned this repo
VM2 - Checks
- Ensure you make necessary changes in the /etc/ssh/sshd_conf file to enable remote log-in



# Steps
#### 1. sudo ansible-galaxy install nginxinc.nginx
#### 2. sudo ansible-galaxy install nginxinc.nginx_controller_agent
#### 3. sudo git clone https://github.com/learnbyseven/ansible.git && cd ansible 

### 4. ng+ remote install, sample (Provide target hosts entry inside inventory-hosts.yml)
#sudo ansible-playbook -i inventory-hosts.yml nginxplus-install-playbook.yml

Verify : systemctl status nginx

### 5.ctr agent install, sample (Use option -e for your enviornment specific variables) or define variables value inside ctr-agent-install-playbook.yml
#sudo ansible-playbook -i inventory-hosts.yml ctr-agent-install-playbook.yml -e "api_key=abcdefg123 nginx_controller_fqdn= cts.giri.local nginx_controller_location=india-east"

Verify : service controller-agent status

### 6. Remove Nginx-plus (Verify inventory-hosts.yml before play)
#sudo ansible-playbook -i inventory-hosts.yml uninstall-ctr-agent-playbook.yml
### 7. Remove controller-agent (Verify inventory-hosts.yml before play)
#sudo ansible-playbook -i inventory-hosts.yml remove-nginxplus-playbook.yaml
### 8. Create Gateway (perquisites GUI tasks : Environnment/instance/certs/Application)
#sudo ansible-playbook -i inventory-hosts.yml create-gateway.yml

OPT: GATEWAY
