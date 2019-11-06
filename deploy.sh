#!/bin/bash
set -x
cd /Users/pu20057981/Downloads/apache-tomcat-8.5.47/webapps
rm -rf *.war
cp /Users/Shared/Jenkins/Home/workspace/gol_pipeline3_pipelinescript_from_SCM/gameoflife-web/target/gameoflife.war .
cd /Users/pu20057981/Downloads/apache-tomcat-8.5.47/bin
./shutdown.sh
sleep 5s
BUILD_ID=dontKillMe sh startup.sh &
