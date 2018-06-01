#!/bin/bash
cd /opt
sudo yum install perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https -y
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip
rm CloudWatchMonitoringScripts-1.2.2.zip
cd aws-scripts-mon
crontab -l | { cat; echo "* * * * * /opt/aws-scripts-mon/mon-put-instance-data.pl --mem-util  --auto-scaling=only >> /var/log/send_metrics_cw.log"; } | crontab -
