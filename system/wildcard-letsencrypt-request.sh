#!/bin/bash
#certbot-auto certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns --manual-auth-hook "/path/to/hook-script.sh" --manual-cleanup-hook "/path/to/hook-clean-script.sh" -d 'yourdomain.tld,*.yourdomain.tld'
certbot-auto certonly --manual --preferred-challenges dns -d 'pknw1plex.co.uk, *.pknw1plex.co.uk'


