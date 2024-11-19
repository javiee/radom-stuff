# User Management Role

This Ansible role is designed to manage user accounts, their groups, and permissions on Linux systems. It allows for the creation of users, assignment to specific groups, configuration of SSH keys, and setup of sudo privileges.

## Features

- Create groups
- Create users and assign them to specific groups.
- Configure SSH public keys for secure access.
- Define sudo privileges for user groups with customizable command restrictions.
---

## Variables

The role is fully customizable through the following variables, defined in the `vars/main.yml` file.

### **Group Variables**

- `users_monad_groups`: 
  - A list of groups to be created on the target system.
  - Example:
    ```yaml
    users_monad_groups:
      - administrators
      - operators
    ```

### **Sudo Configuration**

- `users_group_sudoers`: 
  - A list of group-level sudo configurations.
  - Example:
    ```yaml
    users_group_sudoers:
      - group: administrators
        no_password_required: true
        commands: ALL

      - group: operators
        no_password_required: true
        commands: /sbin/reboot
    ```

  - **Options**:
    - `group`: The name of the group.
    - `no_password_required`: If `true`, members of this group can execute sudo commands without being prompted for a password.
    - `commands`: A list of allowed commands (or `ALL` for unrestricted access).

### **User Variables**

- `users_monad`: 
  - A list of user definitions, including the group they belong to and their SSH public key.
  - Example:
    ```yaml
    users_monad:
      #################### ADMINISTRATORS #####################
      - name: devops
        group: administrators
        ssh_key: "ssh-ed25519 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx jcaro@mylaptop"

      #################### OPERATORS ##########################
      - name: bob
        group: operators
        ssh_key: "ssh-ed25519 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx jcaro@mylaptop"
    ```

  - **Options**:
    - `name`: Username to be created on the target system.
    - `group`: Group to which the user will be assigned.
    - `ssh_key`: The user's SSH public key for secure login.

---

## How to Use

1. **Include the Role in Your Playbook**:
   Add the role to your Ansible playbook:
   ```yaml
   - name: Manage Users
     hosts: all
     roles:
       - role: users
