#!/bin/bash
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.$(date +%s)
sed -i 's/#PermitRootLogin prohibit-password/#PermitRootLogin yes/g' /etc/ssh/sshd_config
