#!/bin/bash
# Set --level=[n] to the depth of links you want to follow during archiving,  or add 
# --mirror and remove --span-hosts and --no-parent if you want to archive an entire domain.
# At time of writing the PDF reports were 1 clicks from the URL, hence the --level=2
# -w 10 adds a 10 second delay between requests
# --random-wait will multiply the -w value by a random number between .5 and 1.5
#   ^^^^^^^^----- this will make the connection look more natural to avoid QoS/botdetection
wget --server-response \
     --no-verbose \
     --adjust-extension \
     --convert-links \
     --force-directories \
     --backup-converted \
     --compression=auto \
     -e robots=off \
     --restrict-file-names=unix \
     --timeout=60 \
     --warc-file=warc \
     --page-requisites \
     --no-check-certificate \
     --no-hsts \
     --recursive \
     --mirror \
     --level=2 \
     --warc-file=$(date +%s) \
     --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36" \
     https://www.archives.gov/research/jfk/release-2025 
