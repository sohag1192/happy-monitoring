# Download & Extract Prometheus
#=============#============#====
wget https://github.com/prometheus/snmp_exporter/releases/download/v0.21.0/snmp_exporter-0.21.0.linux-amd64.tar.gz ;
tar xvf snmp_exporter-0.21.0.linux-amd64.tar.gz	;

# Make directory & move file
#=============#========#====
mv /opt/happy-monitoring-main/snmp_exporter-0.21.0.linux-amd64 /etc/snmp_exporter	;
chmod +x /etc/snmp_exporter/snmp_exporter	;
cp /opt/happy-monitoring-main/etc/systemd/system/snmp_exporter.service /etc/systemd/system/	;

# Reload services file
#========#=========#====
/bin/systemctl daemon-reload	;

# Restart the services
#====#===========#======
/bin/systemctl restart snmp_exporter	;

# Start services at boot
/bin/systemctl enable snmp_exporter	;

# Show services status
#====#===========#=====
/bin/systemctl status snmp_exporter	;
