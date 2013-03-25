#!/bin/bash

set -eux # -x for verbose logging
juju bootstrap
juju deploy --constraints "instance-type=m1.large" --repository=. local:precise/org-manager
juju expose org-manager
