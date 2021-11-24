#!/bin/bash
cd /home/container
sleep 1

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# If auto update is not set or set to true then update
if [ -z ${AUTO_UPDATE} ] || [ "${AUTO_UPDATE}" == 1 ]; then
    # Update Source Server
    chmod u+x steamcmd/steamcmd.sh
    ./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 211820 +quit

    echo -e "Finished update check."
else
    echo -e "Not updating game server as auto update was set to 0. Starting server"
fi

# Replace startup variables.
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
