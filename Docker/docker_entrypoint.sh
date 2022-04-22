#!/bin/bash

set -e

exec service ssh start &
exec echo 'ok' &
exec python3 /root/dof_bionic_dog/dht11-sensor-iot/sensor-iot.py &
exec bash
