# Function to check if apt is available
check_package_manager() {
    if ! command -v apt &> /dev/null; then
        echo "This script requires apt package manager."
        exit 1
    fi
}

# Function to check if Singularity already exists
check_name_conflict() {
    if command -v singularity &> /dev/null; then
        echo "Conflict detected: The command 'singularity' already exists."
        echo "This script will not install Singularity as it could interfere with system behavior."
        exit 1
    fi
}

# prompts confirm message to go with the installation of the program
prompt_installation() {
    echo "The following software will be installed: Singularity (Apptainer)"
    read -p "Do you want to proceed with the installation? (y/n): " response
    case $response in
        [Yy]* ) return 0 ;;
        [Nn]* ) echo "Installation aborted." ; exit 0 ;;
        * ) echo "Invalid input. Installation aborted."; exit 1 ;;
    esac
}

# Main function
install_singularity() {
    check_root
    check_package_manager
    check_name_conflict
    prompt_installation

    echo "Adding Sylabs repository and installing Singularity..."

    # Install required dependencies
    sudo apt update
    sudo apt install -y wget gnupg lsb-release software-properties-common

    # Import Sylabs PGP key
    wget -O- https://pkgs.sylabs.io/keys/sylabs.asc | sudo gpg --dearmor -o /usr/share/keyrings/sylabs-archive-keyring.gpg

    # Add the Sylabs repository
    echo "deb [signed-by=/usr/share/keyrings/sylabs-archive-keyring.gpg] https://pkgs.sylabs.io/apt $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/sylabs.list

    # Update and install Singularity
    sudo apt update
    sudo apt install -y singularity-ce

    # Confirm installation
    echo "Singularity installation complete. You can try running the software with the following command:"
    echo "singularity --version"
}

# Runs the function
install_singularity
