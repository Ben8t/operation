# Customization

It's pretty easy to custom any Dockerfile in this repository and add any operations needed. The folder `operation/src` contains all operations which are defined by a `Dockerfile` and a `config.yml`.

## Configuration file template

```yml
name: operation_name
secret: operation_secret_name
type: alpha
command: docker container ... operation_name
description: A brief description.
```
