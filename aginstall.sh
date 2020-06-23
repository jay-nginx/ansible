#!/bin/bash
ansible-playbook -i inventory-hosts.yml ctr-agent-install-playbook.yml -e "api_key=fakegidfb614c8b56e7098a8e4aff398f656acri nginx_controller_fqdn=cts.giri.local nginx_controller_location=india-zone-east nginx_controller_instance_name=debserver"

