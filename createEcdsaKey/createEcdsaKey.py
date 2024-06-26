import os
import subprocess
import pyperclip

def generate_ecdsa_ssh_key():
    # Directory to save SSH key
    ssh_dir = os.path.expanduser("~/.ssh")
    if not os.path.exists(ssh_dir):
        os.makedirs(ssh_dir)

    # Key name
    key_name = "github_key"

    # Generate ECDSA SSH key pair
    if os.name == "posix":  # Unix-like system
        subprocess.run(["ssh-keygen", "-t", "ecdsa", "-f", os.path.join(ssh_dir, key_name), "-N", ""], check=True)
    elif os.name == "nt":  # Windows
        subprocess.run(["ssh-keygen", "-t", "ecdsa", "-f", os.path.join(ssh_dir, key_name)], shell=True, check=True)

    # Read public key
    with open(os.path.join(ssh_dir, f"{key_name}.pub"), "r") as pub_key_file:
        public_key = pub_key_file.read().strip()

    # Copy public key to clipboard (Windows-specific)
    try:
        pyperclip.copy(public_key)
        print("Public key copied to clipboard.")
    except pyperclip.PyperclipException as e:
        print(f"Failed to copy to clipboard: {e}")

if __name__ == "__main__":
    generate_ecdsa_ssh_key()
