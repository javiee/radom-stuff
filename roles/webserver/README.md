# Ansible Role: Webserver

This Ansible role installs and configures the Nginx web server. It provides flexibility for defining virtual hosts, customizing the Nginx configuration, and managing logs.

## Requirements

- Ansible 2.17.2 or later
- Supported systems: Ubuntu inux distributions (extendable for others)

## Role Variables

The following variables are customizable in the role. Default values are set in the `vars/main.yml` file.

| Variable                      | Default Value                            | Description                                                                                     |
|-------------------------------|------------------------------------------|-------------------------------------------------------------------------------------------------|
| `webserver_nginx_version`     | `1.24.0`                                 | Version of Nginx to install.                                                                    |
| `webserver_nginx_user`        | `www-data`                               | The user under which the Nginx service runs.                                                   |
| `webserver_nginx_root_folder` | `/var/www`                               | The root folder for hosting web content.                                                       |
| `webserver_nginx_log_dir`     | `/var/log/applications/nginx`            | Directory for storing Nginx logs.                                                              |
| `webserver_nginx_port`        | `8443`                                   | The port on which Nginx listens.                                                               |
| `webserver_deploy_monad_default_site` | `true`                          | Whether to deploy a default virtual host for "monad-site".                                      |
| `webserver_vhosts`            | See example below                        | List of virtual hosts with their specific configurations.                                       |

### Virtual Hosts (`webserver_vhosts`)

The `webserver_vhosts` variable allows you to define one or more virtual hosts. Below is the default configuration:

```yaml
webserver_vhosts:
  - port: "{{ webserver_nginx_port }}"
    template: vhost-template.j2
    root: "{{ webserver_nginx_root_folder }}/monad-site"
    index: index.html
    server_name: monad-default
    access_log: "{{ webserver_nginx_log_dir }}/access.log"
    error_log: "{{ webserver_nginx_log_dir }}/error.log"
    location: |
      location / {
        try_files $uri $uri/ =404; }
