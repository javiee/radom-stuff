# Common Server Configuration Role

This Ansible role is designed to apply a consistent baseline configuration across all servers. It manages common tasks such as firewall configuration, package installation, and SSH setup, ensuring all servers are uniformly prepared for deployment and secure operations.

---

## Features

- **Firewall Configuration**:
  - Installs and configures `ufw` (Uncomplicated Firewall).
  - Enables firewall rules for essential ports (e.g., SSH, HTTP).
  - Ensures the firewall is enabled and active.

- **Common Packages Installation**:
  - Installs a list of commonly used packages (e.g., `curl`, `htop`, `vim`).
  - Package list is customizable via variables.

- **SSH Configuration**:
  - Updates the SSH daemon configuration using a Jinja2 template.
  - Restricts root login and enforces secure SSH settings.
  - Restarts the SSH service to apply changes.

---

## Variables

The role is customizable through variables defined in `vars/main.yml`.

### **Firewall Variables**

- `common_firewall_ports`:
  - A list of ports and protocols to allow through the firewall.
  - Example:
    ```yaml

    ```

### **Package Variables**

- `common_packages`:
  - A list of packages to install on all servers.
  - Example:
    ```yaml
    common_packages:
      - curl
      - htop
      - vim
    ```

### **SSH Variables**

- `ssh_config`:
  - Path to the SSH daemon configuration template.
  - Example:
    ```yaml
    ssh_config: "templates/sshd_config.j2"
    ```
---

## How to Use

1. **Include the Role in Your Playbook**:
   Add the role to your Ansible playbook:
   ```yaml
   - name: Apply Common Configuration
     hosts: all
     roles:
       - role: base
