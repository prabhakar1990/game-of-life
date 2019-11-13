#!/bin/bash
set -x
cd /Users/pu20057981/apache-tomcat-8.5.47/webapps
rm -rf *.war
rm -rf gameoflife
cp /Users/Shared/Jenkins/Home/workspace/gol_pipeline3_pipelinescript_from_SCM/gameoflife-web/target/gameoflife.war .
cd /Users/pu20057981/apache-tomcat-8.5.47/bin
./shutdown.sh
sleep 5s
JENKINS_NODE_COOKIE=dontKillMe sh startup.sh &
