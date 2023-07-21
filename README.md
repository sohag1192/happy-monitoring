# Monitoring gives you high security.

# Instructions for Install Tick_Stack (Influxdb, Telegraf and Grafana).
```bash
apt install -y unzip ;
cd /opt/
wget https://github.com/riponmollick66/happy-monitoring/archive/refs/heads/main.zip
unzip main.zip
chmod +x /opt/happy-monitoring-main/tick_stack.sh
/opt/mikrotik-log-main/install.sh
```
# Add database user
```bash
 influx	
 CREATE USER "admin" WITH PASSWORD 'admin' WITH ALL PRIVILEGES
 show users
 exit
```
# Enable InfluxBD Authentication
```bash
sudo nano /etc/influxdb/influxdb.conf
```
Locate the [http] section, uncomment the auth-enabled option, and set its value to true
# Telegraf Configuration
```bash
nano /etc/telegraf/telegraf.conf
```
Locate the [outputs.influxdb] section and provide the username and password
# Restart the services
```bash
systemctl restart influxdb telegraf grafana-server
```
# Start services at boot
```bash
systemctl enable influxdb telegraf grafana-server
```
# Show services status
```bash
systemctl status influxdb telegraf grafana-server
```
# Show metrics is collecting
```bash
 influx -username 'admin' -password 'admin'
 show databases
 use telegraf
 show measurements
 exit
```

# Instructions for Install Prometheus
```bash
apt install -y unzip ;
cd /opt/
wget https://github.com/riponmollick66/happy-monitoring/archive/refs/heads/main.zip
unzip main.zip
chmod +x /opt/happy-monitoring-main/prometheus.sh
/opt/happy-monitoring-main/prometheus.sh
```

# Instructions for Install SNMP_Exporter
```bash
apt install -y unzip ;
cd /opt/
wget https://github.com/riponmollick66/happy-monitoring/archive/refs/heads/main.zip
unzip main.zip
chmod +x /opt/happy-monitoring-main/snmp_exporter.sh
/opt/happy-monitoring-main/snmp_exporter.sh
```
