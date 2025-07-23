# Charmed Kafka UI snap repository.

[![Snapcraft Badge](https://snapcraft.io/charmed-kafka-ui/badge.svg)](https://snapcraft.io/charmed-kafka-ui)
[![Release](https://github.com/canonical/charmed-kafka-ui-snap/actions/workflows/publish.yaml/badge.svg)](https://github.com/canonical/charmed-kafka-ui-snap/actions/workflows/publish.yaml)

## Building

To build locally, use `snapcraft --debug`

## Using the snap

Install the snap (e.g. `sudo snap install ./charmed-kafka-ui_1.2.0_amd64.snap --dangerous --devmode`).

To run the snap, you will require a running Kafka cluster. You can use the following:

```bash
# installing kafka cluster
sudo snap install charmed-zookeeper --channel 3/edge
sudo snap install charmed-kafka --channel 3/edge

# copying default config
sudo cp /snap/charmed-kafka/current/opt/kafka/config/server.properties /var/snap/charmed-kafka/current/etc/kafka/server.properties
sudo cp /snap/charmed-zookeeper/current/opt/zookeeper/conf/zoo_sample.cfg /var/snap/charmed-zookeeper/current/etc/zookeeper/zoo.cfg
sudo cp /snap/charmed-zookeeper/current/opt/kafka-ui/config/application-local.yml /var/snap/charmed-kafka/current/etc/kafka-ui/application-local.yml

# starting services
sudo snap start charmed-zookeeper
sleep 5
sudo snap start charmed-kafka
sleep 5
sudo snap start charmed-kafka-ui.daemon
```

### Configuration

Place any custom Kafka UI configuration in the snap data directory at `/var/snap/charmed-kafka-ui/current/etc/kafka-ui/application-local.yml`.

Once you have updated the configuration file, you can restart the snap service to apply the changes with `snap restart charmed-kafka-ui.daemon`
