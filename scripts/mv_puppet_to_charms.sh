#!/bin/bash

# A script to copy ./Puppet dir compressed to all data dirs of charms that can be used.

# Build Puppet zipfile...
cp -r Puppet Puppet_temp
rm -rf Puppet/.git
zip -r Puppet.zip Puppet/

# Copy to charm dirs
rm ./precise/*/data/Puppet.zip
for dir in ./precise/*/data; do [ -d "$dir" ] && cp Puppet.zip "$dir"/Puppet.zip ; done

# Cleanup
rm -rf Puppet.zip Puppet/
mv Puppet_temp Puppet
