#!/bin/bash

set -eux # -x for verbose logging
juju bootstrap
juju deploy --constraints "instance-type=m1.large" --repository=. local:precise/frontend
# juju deploy --constraints "instance-type=m2.2xlarge" --repository=. local:precise/www
juju deploy --constraints "instance-type=m1.large" --repository=. local:precise/www
# juju deploy --constraints "instance-type=hi1.4xlarge" --repository=. local:precise/db-master
juju deploy --constraints "instance-type=m1.large" --repository=. local:precise/db-master

juju add-relation frontend www
juju add-relation www db-master
juju expose frontend
