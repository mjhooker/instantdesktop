#!/bin/bash

facter | grep ipaddress | tr " " "\011" | cut -f3 | head -1
