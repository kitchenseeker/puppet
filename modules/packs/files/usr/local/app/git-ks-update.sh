#!/bin/bash
cd /var/www
git pull --commit git@github.com:kitchenseeker/www.git
git add -A
git commit -m "${HOSTNAME} commit on `date`"
git push git@github.com:kitchenseeker/www.git
