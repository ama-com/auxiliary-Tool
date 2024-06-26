import os
import platform

def generate_ssh_config():
    # Directory to save SSH config file
    ssh_dir = os.path.expanduser("~/.ssh")
    if not os.path.exists(ssh_dir):
        os.makedirs(ssh_dir)

    # SSH config file path
    config_file = os.path.join(ssh_dir, "config")

    # GitHub SSH configuration
    github_config = f"""
Host github.com
    HostName github.com
    User git
    IdentityFile {"~/.ssh/github_key" if platform.system() == 'Windows' else os.path.join(ssh_dir, 'github_key')}
"""

    # Write GitHub SSH configuration to file
    with open(config_file, "w", newline='\n' if platform.system() != 'Windows' else '\r\n') as f:
        f.write(github_config.strip())

    print(f"SSH config file generated: {config_file}")

if __name__ == "__main__":
    generate_ssh_config()
