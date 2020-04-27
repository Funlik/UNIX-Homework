#!/bin/bash
if ! [ -d /files/.git ]; then
	git init /files/
fi
python3 -m http.server 80 --directory /files &
cron -f &
smbd --foreground --no-process-group