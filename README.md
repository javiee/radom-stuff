
## Prerequisites
- **Ubuntu**: Version 24.04
- **Ansible**: Version 2.17 
- **Python**: Version 3.6 
- **python3-passlib**: Version latest
- Ensure the target hosts are accessible via SSH with the required permissions.

## Usage

### Running Playbooks

Use the `Makefile` to run playbooks. You can specify the inventory file by setting the `INVENTORY` variable. If not specified, the default inventory is `staging/hosts`.

#### Common Commands:

- **Run the `base` playbook**:
  ```bash
  make base

