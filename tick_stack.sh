# Install basic packages
#====#===========#========
/usr/bin/apt update	-y ;
/usr/bin/apt install -y curl gnupg wget	;

# Adding Repository
#====#===========#=====
/usr/bin/wget -q https://repos.influxdata.com/influxdata-archive_compat.key
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list
/usr/bin/apt-get install -y adduser libfontconfig1	;
/usr/bin/wget https://dl.grafana.com/oss/release/grafana_9.3.1_amd64.deb	;

# Install required packages
#====#===========#===========
/usr/bin/apt update	-y ;
/usr/bin/apt-get install -y influxdb telegraf;
/usr/bin/dpkg -i grafana_9.3.1_amd64.deb	;

# Load the new service file
/bin/systemctl daemon-reload	;

# Start the services
#====#===========#====
/bin/systemctl start influxdb	;
