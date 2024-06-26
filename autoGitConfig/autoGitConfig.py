import subprocess

def set_git_config():
    while True:
        git_username = input("Enter your Git username: ").strip()
        if not git_username:
            print("Username cannot be empty. Please try again.")
        else:
            break

    while True:
        git_email = input("Enter your Git email address: ").strip()
        if not git_email:
            print("Email address cannot be empty. Please try again.")
        elif '@' not in git_email:
            print("Invalid email address format. Please enter a valid email address.")
        else:
            break

    # Set Git global configuration
    subprocess.run(['git', 'config', '--global', 'user.name', git_username])
    subprocess.run(['git', 'config', '--global', 'user.email', git_email])

    print("Git configuration completed successfully.")

if __name__ == "__main__":
    set_git_config()
