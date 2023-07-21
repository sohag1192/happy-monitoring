# Add user and groud
#===============#=====
sudo groupadd --system prometheus	;
sudo useradd -s /sbin/nologin --system -g prometheus prometheus	;

# Make direcory
#=========#=====
mkdir /var/lib/prometheus /etc/prometheus	;

# Download & Extract prometheus
#============#============#======
cd /opt/	;
wget https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz	;
tar xvf prometheus-2.45.0.linux-amd64.tar.gz	;

# Move direcory & files
#=====#==========#======
cd prometheus-2.45.0.linux-amd64	;
mv prometheus promtool /usr/local/bin/	;
mv prometheus.yml /etc/prometheus/	;
mv consoles/ console_libraries/ /etc/prometheus/	;
cp /opt/happy-monitoring-main/etc/systemd/system/prometheus.service /etc/systemd/system/	;

# Provide permission
#===============#====
chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus/	;
chmod -R 775 /etc/prometheus/	;

# Remove downloaded files
#=====#===========#======
rm -rf /opt/prometheus*	;

# Load the new service file
#===========#==========#=====
/bin/systemctl daemon-reload	;

# Start services at boot
#====#===========#===========
/bin/systemctl enable prometheus	;

# Restart the services
#====#===========#===========
/bin/systemctl restart prometheus	;

# Show services status
#====#===========#===========
/bin/systemctl status prometheus	;