#!/bin/bash

set -e

"${SNAP}"/usr/bin/setpriv \
    --clear-groups \
    --reuid _daemon_ \
    --regid _daemon_ -- \
    ${SNAP}/usr/lib/jvm/java-21-openjdk-amd64/bin/java -Dspring.config.additional-location=${SNAP_DATA}/etc/kafka-ui/application-local.yml --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED $JAVA_OPTS -jar ${SNAP}/opt/kafka-ui/libs/api-1.2.0.jar
