#!/bin/bash
if ! (curl -s wttr.in | head -n 3 | grep -i -q rain) then
	killall -STOP smbd
	tar zcf /files/backup-$(date +%Y-%m-%d).tar.gz /files/*.html
	killall -CONT smbd
fi