# Runtime configuration of the hashistack Vagrant box

There are two layers of configuration built into the box.

## Outer layer ( advanced )

### Pre or post ansible bootstrap procedure

#### Pre
You may add a `pre_ansible.sh` script file to this directory to run any alterations **before** ansible bootstrap procedure will run.

This might come handy if you need to change or replace that bootstrap process. For example you replacing the entire `/etc/ansible` directory.
For most cases, you are probably looking to add configuration in [pre/poststart bootstrap](../bootstrap)

#### Post
If you need to run additional commands after ansible bootstrap has happened, you may add a `post_ansible.sh`.
This might come in handy if you would like to pat your self on tha back or test a recent configuration change before anything you might add to your own Vagrantfile.

## Inner layer ( easy )

There are two primary cases for customization.

### Add or override hashistack configurations

- [nomad/](nomad/README.md)
- [consul/](consul/README.md)
- [vault/](vault/README.md)

### Add pre and post bootstrap tasks

- [pre bootstrap example](https://github.com/fredrikhgrelland/vagrant-hashistack-template/blob/master/template_example/dev/vagrant/bootstrap/consul/pre/510-prestart-example.yml)
- [post bootstrap example](https://github.com/fredrikhgrelland/vagrant-hashistack-template/blob/master/template_example/dev/vagrant/bootstrap/consul/post/510-poststart-example.yml)
