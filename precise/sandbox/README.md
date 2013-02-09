## Hacked together charm to prove out sandbox style deployment to EC2 host cloud

### Get your juju going...

```sh
juju bootstrap
juju deploy --constraints "mem=4G" --repository=allplayers local:precise/sandbox
```

### Vagrantfile initializtion

https://gist.github.com/glennpratt/e80c2351e7df60a5f5db
