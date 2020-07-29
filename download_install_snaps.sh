#!/bin/bash

#snapd
until snap download snapd; do
  echo Download disrupted, resuming in 5 seconds...
  sleep 5
done
snap ack snapd_8544.assert
snap install snapd_8544.snap

# core18
until snap download core18; do
  echo Download disrupted, resuming in 5 seconds...
  sleep 5
done
snap ack core18_1882.assert
snap install core18_1882.snap

# ammp-connect
until snap download ammp-connect; do
  echo Download disrupted, resuming in 5 seconds...
  sleep 5
done
snap ack ammp-connect_65.assert
snap install ammp-connect_65.snap

# ammp-edge
until snap download ammp-edge; do
  echo Download disrupted, resuming in 5 seconds...
  sleep 5
done
snap ack ammp-edge_570.assert
snap install ammp-edge_570.snap
