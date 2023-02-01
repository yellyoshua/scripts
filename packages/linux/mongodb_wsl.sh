#!/bin/bash
set -e

MONGODB_VERSION="${MONGODB_VERSION}" || "4.4.1"

MONGODB_PATH="/opt/mongodb"
MONGODB_BIN_PATH="/opt/mongodb/bin"
MONGODB_DATA_PATH="/data/db"

MONGODB_REPOSITORY_VERSION="4.4"

if [ MONGODB_VERSION == "4.4.1" ]; then
  MONGODB_REPOSITORY_VERSION="4.4"
fi

if [ MONGODB_VERSION == "4.2.8" ]; then
  MONGODB_REPOSITORY_VERSION="4.2"
fi

if [ MONGODB_VERSION == "5.0.0" ]; then
  MONGODB_REPOSITORY_VERSION="5.0"
fi

# Install mongodb for WSL use microsoft
wget -qO - https://www.mongodb.org/static/pgp/server-${MONGODB_REPOSITORY_VERSION}.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/${MONGODB_REPOSITORY_VERSION} multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${MONGODB_REPOSITORY_VERSION}.list
apt update
apt install -y mongodb-org

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

# Create mongodb init script
wget https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d -O /etc/init.d/mongodb
chmod +x /etc/init.d/mongodb

# Enable mongodb service
systemctl enable mongodb

# Start mongodb service
systemctl start mongodb

# Check mongodb version
mongo --version

# Check mongodb service status
systemctl status mongodb


