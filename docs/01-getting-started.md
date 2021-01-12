# Getting started

While it is build with *bash* the only dependency you will need is [Docker](https://docs.docker.com/install/).

Then you can clone the repository and add shortcuts in your terminal :

* `git clone https://github.com/Ben8t/operation.git`

* Add the following lines to your shell session script (`.bashrc` or `.zshrc` or `config.fish`, etc...).

```bash
export OPERATION_FOLDER=<installation_path>
alias operation="${OPERATION_FOLDER}/operation.sh"
```

`<installation_path>` is the full path where you cloned this repository.

> Tips : you can change the alias by "ops" for your lazy fingers...

* Run `operation briefing`. It may take a little time while it is building all Docker images. To build only one operation you can run `operation briefing <operation_name>`.

* Run `operation test` to test the installation. This routine should print "Roger that." in your console.
