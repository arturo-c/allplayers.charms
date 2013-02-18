## Test Charms for deployment across different environments {EC2, MAAS} using Juju

Some links of note:

*  [Juju Getting started](https://juju.ubuntu.com/docs/getting-started.html)
   *  [EC2 environment config](https://juju.ubuntu.com/docs/getting-started.html)
   *  MAAS
      *  [Installing MAAS](http://maas.ubuntu.com/docs/quantal/install.html)
         *  [Virtualbox MAAS install](http://marcoceppi.com/2012/05/juju-maas-virtualbox/) / [and another](http://csfreebird.blogspot.com/2012/08/setup-ubuntu-cloud-in.html)
            *  [Virtualbox networking](http://www.virtualbox.org/manual/ch06.html) [2](https://blogs.oracle.com/fatbloke/entry/networking_in_virtualbox1)
      *  [MAAS testing](https://wiki.edubuntu.org/SecurityTeam/TestingMAAS)
      *  [MAAS troubleshooting](http://maas.ubuntu.com/docs/troubleshooting.html)
      *  [Juju Quick Start](http://people.canonical.com/~gavin/docs/lp:maas/juju-quick-start.html)
      *  [FAQ](https://answers.launchpad.net/maas/+faqs)

*  [Writing a Charm]( https://juju.ubuntu.com/docs/write-charm.html)
   *  [Juju Charms Repo](https://code.launchpad.net/charms/+branches?field.lifecycle=MATURE&field.lifecycle-empty-marker=1&field.sort_by=most+recently+changed+first&field.sort_by-empty-marker=1)


## Provisioning AllPlayers stack as a single instance

(sandbox)
`juju deploy --constraints "mem=4G" --repository=. local:precise/sandbox`


## Provisioning AllPlayers stack as interconnected units

(staging / prod)

```sh
juju deploy --constraints "instance-type=m1.large" --repository=. local:precise/frontend
juju deploy --constraints "instance-type=m2.2xlarge" --repository=. local:precise/www
# juju deploy --constraints "instance-type=m2.2xlarge" --repository=. local:precise/www
juju deploy --constraints "instance-type=hi1.4xlarge" --repository=. local:precise/db-master

juju add-relation frontend www
juju add-relation www db-master
juju expose frontend
```


## Development

Match charm name to enforcer role.

Puppet local dev copy to charms: `./scripts/mv_puppet_to_charms.sh`
Templates for hooks shared across all charms: `./scripts/cp_hook_templates.sh`

TODO: Puppet `$name` needs to be replaced with something explicit?
