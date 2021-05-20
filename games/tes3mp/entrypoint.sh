#!/bin/bash
cd /home/container
sleep 1

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

LOGDIR="/home/container/.config/openmw"

if [ "${LOG_AUTOPRUNE}" = 1 ]; then
    if [ -d "$LOG_DIR" ]; then
        echo "AutoPruning logs older than 7 days..."
        find "$LOG_DIR" -type f -name '*.log' -mtime +7 -exec rm {} \;
    fi
    if [ ! -d "$LOG_DIR" ]; then
        echo "AutoPruning enabled but $LOG_DIR does not exist, skipping"
    fi
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
