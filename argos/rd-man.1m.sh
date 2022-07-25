#!/usr/bin/env bash


LOGO_SUS=$(curl -s "file:///home/user/.config/argos/img/logo-sus.png" | base64 -w 0)
LOGO_PI=$(curl -s "file:///home/user/.config/argos/img/logo-pi.png" | base64 -w 0)
LOGO_URZ=$(curl -s "file:///home/user/.config/argos/img/logo-urz.png" | base64 -w 0)

echo "Remote Desktop Manager"
echo "---"
echo "SUS - NX | image='$LOGO_SUS' imageWidth=20 terminal=false bash=' \
    nmcli connection up Uni-Heidelberg || true && \
    sleep 5 && \
    x2goclient --session=susnx-ziti --close-disconnect --thinclient && \
    nmcli connection down Uni-Heidelberg || true'"

echo "CIP-Pool | image='$LOGO_PI' imageWidth=20 terminal=false bash='\
    nmcli connection up Uni-Heidelberg || true && \
    sleep 5 && \
    x2goclient --session=cip-pool --close-disconnect --thinclient && \
    nmcli connection down Uni-Heidelberg || true'"

echo "URZ - Windows | image='$LOGO_URZ' imageWidth=20 terminal=false bash=' \
    rdesktop ts-mita.ad.uni-heidelberg.de -u kw283 -d AD -k de -r disk:seminar=/home/user/uni/sem -z'"
