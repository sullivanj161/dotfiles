1. Pick one of the following packages to install for Ubuntu Linux
   For this assignment, I chose to install Linux Singularity Packages, I installed these on my interface by using the website
   https://docs.sylabs.io/guides/3.0/user-guide/installation.html to help me with the install processd. To install, I just simply used the commands on the website sudo apt-get update && sudo apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config which installed all of the dependencies for me

   According to https://docs.sylabs.io/guides/3.0/user-guide/installation.html on the basis of installing singularity, you can also remove old versions of singularity that may have existed in the Linux environment by issuing the command
$ sudo rm -rf \
    /usr/local/libexec/singularity \
    /usr/local/var/singularity \
    /usr/local/etc/singularity \
    /usr/local/bin/singularity \
    /usr/local/bin/run-singularity \
    /usr/local/etc/bash_completion.d/singularity
    This can be of use when starting a step to do a fresh install of Singularity onto the Ubuntu environment

then for Singularity to function, I needed to install Go for the singularity pacakge to run
using ChatGPT, I ran the command sudo apt install -y golang.go to install Go

Then also using ChatGPT, I wanted to install the software for singularity, I first went to the website to find the latest website
According to the all Apptainer repository on Github, the latest version. First I ran export VERSION=3.8.7 and then  wget https://github.com/apptainer/singularity/releases/download/v3.8.7/singularity-3.8.7.tar.gz to download the tar file. Then according to ChatGPT, the tar needed to be extracted 
According to chatgpt, the commands needed are tar -xvzf singularity-${VERSION}.tar.gz and cd to the singularity directory We will want to change to the singularity directory now in order to install the Singularity applcation. I did however notice I that my make file was in the builddir. so I went there and ran make -j4 which seems to download most of the Go packages which is required for singularity to run due to using these packages to being built for Singularity after this was finished I ran a singularity --version to command to see if everything was installed and it came back as 3.8.7 
![image](https://github.com/user-attachments/assets/78de9ac8-a95a-4a03-9482-dc72e30183bb)


   2. Write a script for Singularity or for system packages
  For this step, I created a script with help from ChatGPT to create a script that performs all of the requirements 
checks for root user
check_root() {
    if [[ "$(id -u)" -ne 0 ]]; then
        echo "This script requires sudo or root privileges."
        exit 1
    fi
}

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

As mentioned, this code was written entirely using ChatGPT since I do not have much experience in coding for ubuntu terminals
after this code was written, I issued it to be executable by using the chmod +x installsingularity.sh this makes the script entirely executable by force
