#!/bin/bash
cd /Users/pu20057981/Downloads/apache-tomcat-8.5.47/webapps
rm -rf *.war
cp /Users/Shared/Jenkins/Home/workspace/goi_pipeline2/gameoflife-web/target/gameoflife.war .
cd /Users/pu20057981/Downloads/apache-tomcat-8.5.47/bin
./shutdown.sh
sleep 5s
./startup.sh
