#!/bin/bash
cd /home/container
sleep 1

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

LATEST_JSON=$(curl --silent "https://api.github.com/repos/${GITHUB_PACKAGE}/releases/latest")
RELEASES=$(curl --silent "https://api.github.com/repos/${GITHUB_PACKAGE}/releases")
LATEST_VER=$(echo ${LATEST_JSON} | jq -r '.tag_name')
if [ -f "version.txt" ]; then
    read -r CURRENT_VER < version.txt
fi

## if auto_update is not set or to true update
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == 1 ]; then
    # Update Source Server
    chmod u+x steamcmd/steamcmd.sh
    ./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 896660 +quit

    # Update if version.txt is missing or blank.
    if [[ ! -f "version.txt" ]] || [[ -z ${CURRENT_VER} ]] || [[ ${VERSION} == "latest" ]] && [[ ${CURRENT_VER} != ${LATEST_VER} ]]; then
        echo "${LATEST_VER}" > version.txt
        DOWNLOAD_LINK=$(echo ${LATEST_JSON} | jq .assets | jq -r .[].browser_download_url | grep -i ${MATCH})
        wget -N $DOWNLOAD_LINK
        unzip -o $MATCH
        rm -fR $MATCH
        chmod u+x valheim_server.x86_64
    fi

    echo -e "Finished update check."
else
    echo -e "Not updating game server as auto update was set to 0. Starting server"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
