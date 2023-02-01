#!/bin/bash

MONGODB_VERSION="${MONGODB_VERSION}" || "4.4.1"
MONGODB_PATH="/opt/mongodb"
MONGODB_BIN_PATH="/opt/mongodb/bin"
MONGODB_DATA_PATH="/data/db"

# Install mongodb for linux
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz -O /tmp/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz
tar -xvf /tmp/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz -C /tmp
mv /tmp/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION} ${MONGODB_PATH}
rm /tmp/mongodb-linux-x86_64-ubuntu2004-${MONGODB_VERSION}.tgz

# Create mongodb user
useradd -r -s /bin/false mongodb

# Create mongodb data directory
sudo mkdir -p ${MONGODB_DATA_PATH}
sudo chown mongodb:mongodb ${MONGODB_DATA_PATH}

# Prevent "Attempted to create a lock file on a read-only directory: /data/db"
sudo chmod 777 ${MONGODB_DATA_PATH}

# Create mongodb log directory
sudo mkdir -p /var/log/mongodb
sudo chown mongodb:mongodb /var/log/mongodb

# Create mongodb configuration file
cat << EOF > /etc/mongodb.conf
# mongodb.conf
# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: ${MONGODB_DATA_PATH}
  journal:
    enabled: true
  engine: wiredTiger

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongodb.log

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1

# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo
EOF

# Create mongodb service
cat << EOF > /etc/systemd/system/mongodb.service
[Unit]
Description=MongoDB Database Server
After=network.target

[Service]
Type=forking
User=mongodb
Group=mongodb
ExecStart=/etc/init.d/mongodb.service start
ExecStop=/etc/init.d/mongodb.service stop
ExecReload=/etc/init.d/mongodb.service restart
TimeoutSec=30
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Create mongodb service start script
wget https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d -O /tmp/init.d
mv /tmp/init.d /etc/init.d/mongodb.service
chmod +x /etc/init.d/mongodb.service

# Enable mongodb service
systemctl enable mongodb.service

# Start mongodb service
systemctl start mongodb.service

# Check mongodb service status
systemctl status mongodb.service

# Check mongodb version
/opt/mongodb/bin/mongod --version

# Set mongodb to start on boot
systemctl enable mongodb.service

# Create mongodb symbolic link
ln -s ${MONGODB_BIN_PATH}/mongod /usr/bin/mongod