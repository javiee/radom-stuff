# Ansible Role: Promtail

This Ansible role installs and configures [Promtail](https://grafana.com/docs/loki/latest/clients/promtail/), a log collector for Grafana Loki, on your systems. 

## Requirements

- Developed for ansible 2.17.6
- Supported systems: Ubuntu

## Role Variables

Below is a list of variables available for customization. All variables are defined in the role's `vars/main.yml` file:

| Variable                 | Default Value                                                                                             | Description                                                                                       |
|--------------------------|---------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `promtail_version`       | `3.2.1`                                                                                                 | The version of Promtail to install.                                                              |
| `promtail_package_url`   | `https://github.com/grafana/loki/releases/download/v{{ promtail_version }}/promtail_{{ promtail_version }}_amd64.deb` | URL to download the Promtail `.deb` package.                                                     |
| `promtail_loki_server`   | `http://localhost:3100/loki/api/v1/push`                                                                | The Loki server endpoint to push logs to.                                                        |
| `promtail_scrape_configs`| See below                                                                                              | List of scrape configurations for Promtail.                                                      |

### Scrape Configurations

The `promtail_scrape_configs` variable allows you to define multiple jobs and paths for log collection. Below is the default configuration:

```yaml
promtail_scrape_configs:
  - job_name: system
    static_configs:
      - targets:
          - localhost
        labels:
          job: messages
          __path__: /var/log/syslog
      - targets:
          - localhost
        labels:
          job: auth
          __path__: /var/log/auth.log
  - job_name: nginxlogs
    static_configs:
      - targets:
          - localhost
        labels:
          job: applogs
          __path__: /var/log/applications/nginx/*.log
