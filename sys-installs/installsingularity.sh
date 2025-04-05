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
    # Ensure user is root
    check_root

    # checks if apt already exists
    check_package_manager

    # checks if name is not already assigned
    check_name_conflict

    # prompts installation
    prompt_installation

    # installs the application silently 
    sudo apt update && sudo apt install -y singularity-container

    # Confirm installation completion
    echo "Singularity installation complete. You can try running the software with the following command:"
    echo "singularity --version"
}

# Runs the function
install_singularity