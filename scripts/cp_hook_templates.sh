#!/bin/bash

# Copy template hooks to all charms
for dir in ./precise/*/hooks; do [ -d "$dir" ] && cp templates/* "$dir"/. ; done

