#!/bin/bash

# Install wkhtmltopdf v0.12.3 from github wkhtmltopdf/wkhtmltopdf
#

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb -O /tmp/wkhtmltox_0.12.6-1.focal_amd64.deb
apt install -y /tmp/wkhtmltox_0.12.6-1.focal_amd64.deb
rm /tmp/wkhtmltox_0.12.6-1.focal_amd64.deb