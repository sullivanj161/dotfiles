Task 1 Issue Summarization



[vim and Vundle missing copy of .vimrc in repo]

- In this issue all that was missing was a copy of the .vimrc file in the repo

- .vimrc was responsible for the configuration file for the Vundle application, in this task, we managed and configured with the .vimrc to use Vundle plugins

- The .vimrc plugins I had chosen were jellybeans and youcompletemenow

- The .vimrc seemed to have worked properly but was just missing in the .vimrc repo



[What could have been done?]

Instead, I could have taken my time with this assignment and put attempted to find a way to 

- Easily migrate the .vimrc file (used using a flash drive)

- asked for help

- conducted the assignment at an earlier and more convinient time

Issues 2 and 3



[Script Issues]

The first issue was that the script should only install vundle if vundle directory was not found and I completely skipped this step and overlooked it.

- Used ChatGPT for help reconstructing the script

- Fixed the Code

[What fixed the code?]

The script was fixed via ChatGPT which recommended

-Added else
echo "Vundle is already installed..."
fi

-Added git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim under the echo section  in the if statement, this will copy the vim file to that said directory from its original location to the github repo

[What could have been Improved?]

For this task, the improvement could have been understanding how GitHub works, how coding in Linux works,
I feel like it was overlooked, when writing the code, I was not too sure what I was doing in a sense.

Task 1 Repo Contents are

-.vimrc
-README.md
-Vundle
-viminstall.sh

Task 2 Issue Summarization



[The issue?]

.bashrc alias files were missing from the repository

The bash files were important for because it would have all the aliases and bashes that I had setup in the linux environment for this specific task.



[How was this solved?]

This was solved by doing the following

-Went to Home directory on Linux

-Enabled Hidden Files

-Found .bashrc file

-Used nano command to ensure this was the one used

- Inserted in repo on Linux computer

[What could have been Done?]

Also, overlooked and seemingly disregarded, What could have been done was

- Move the .bashrc over to the repo after completion

- Took the time to double check the completion of the .bashrc file


Markdown Issues
One of the major issues when doing this assignment that the feedback mentions is the formatting,
As far as for the future, 

-trying to do markdown formatting.

-organize everything 

- Benefits if needed to return to the README.md files

- Everything should be readable

- More professional

- Caption Pictures / Screenshots

- This entire readme was constructed and written with professional and readable markdown settings in mind



[Contents of Task 2]

-.bashrc
-README.md
-install.sh


Task 3 Issues

Incorrect README.md name

For this issue,  README.md was actually titled 'sys-installs.md' all I needed to do was re title the md file to README.md.



[How was this resolved?] 

-Click on sys-installs.md

-Click on edit file

-In the top left box where the name is, renamed to README.md

-COMMIT CHANGES



[What could have been Done?]

I may not have noticed this when I submitted, if I remember early I was in sort of a rush to turn this in and move on to other schoolwork

What I should do next time is 

-read directions more carefully

-plan accordingly

-manage time wisely

- Understand concepts of naming files

/Script issue on Singularity/

Script issue that was missing proper singularity install code inside of the script 



[How was this resolved?]

RESOLVED USING CHATGPT FOR ASSISTANCE

Code initially was









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





[What Changed?]

With the little experience I have for Linux script writing, I had ChatGPT make me a script that can help 

[What happened?]
When doing this task, I changed my mind last minute to use ChatGPT as a tool to help setup the script

For example, before hand I was using docs.sylabs.io which was what I used to setup the Singularity on my Linux server

ChatGPT was used to create the script without the use of Sylabs dependencies,

[The New Script]

The new script is generated as

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

SOURCE chatgpt.com

[What does this code do?] 

This code will install the dependencies that were missing from the original script that did not feature the Sylabs prerequisites

Examples:

- sudo apt install -ym wget gnupg lsb-release software-properties-common

- Imports the Sylabs PGP key (which is a cryptographic key for secure data transmissions)

- Adds Repository using echo "deb [signed-by=/usr/share/keyrings/sylabs-archive-keyring.gpg] https://pkgs.sylabs.io/apt $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/sylabs.list
  
- Installs, updates and obtains any missing or required dependencies and updates that are needed using sudo apt update and sudo apt install

- Tells user that the installation is complete



[What could have been done?]

To correctly have solved this issue the first time around what I should have done as the user is

- Keep going with what I had (used Sylabs throughout the whole setup)

- Not be in such a rush.


[Contents of Task 3 Repo]

- installsingularity.sh
- README.md



[Cloning of Repos]

Cloning of repos were performed in the first Task for dotfiles and can be performed on Linux devices using 

-git clone https://github.com/sullivanj161/dotfiles.git ~/dotfiles   (selects the link to use for the cloning 

- cd ~/dotfiles

For the entire repo





For the vim-config 

-git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

- cd ~/vim-config





  For the homefiles

-git clone https://github.com/sullivanj161/dotfiles/homefiles.git ~/homefiles

- cd ~/homefiles






-for the sys-installs

-git clone https://github.com/sullivanj161//dotfiles/sys-installs.git ~/sys-installs

- cd ~/sys-installs
