#!bin/bash

mkdir -p sim/vivado/proj/logs

vivado \
  -source sim/vivado/proj.tcl \
  -log sim/vivado/proj/logs/vivado.log \
  -journal sim/vivado/proj/logs/vivado.jou