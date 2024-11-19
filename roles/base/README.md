# Ansible Role: Base

This Ansible role sets up a base configuration for servers by installing essential packages, configuring a firewall using UFW, and ensuring SSH  secure access.

## Features

- Installs common utility packages.
- Configures UFW to allow only specified ports and protocols.
- Ensures SSH is enabled and functional.

## Role Variables

The following variables are available for customization. Defaults are set in the `vars/main.yml` file of the role:

| Variable               | Default Value       | Description                                                    |
|------------------------|---------------------|----------------------------------------------------------------|
| `base_common_packages` | `['ufw', 'htop', 'curl', 'vim']` | List of packages to install on the target system.              |
| `base_firewall_ports`  | See below          | List of ports and protocols to allow through the firewall.     |

### Firewall Configuration (`base_firewall_ports`)

The `base_firewall_ports` variable defines the ports and protocols to allow through UFW. Each entry in the list should have the following structure:

```yaml
base_firewall_ports:
  - port: 22
    proto: tcp
