1. Explore some useful bash aliases to mimic or add to your bash environment:
   Some bash aliases that I have found useful when researching the pages are
   alias bc="bc -l" for Calclator
   alias .3="cd ../../.." Change directory times 3
   alias gst="git status -sb" Git command
   alias cls='clear' clears the terminal (derived from ChatGPT)
alias ll='ls -lA' shows detailed list of files (also derived from ChatGPT)
alias ext="exit" exits diretory or anywhere in terminal
alias sai="sudo apt install" super user install of package or files for terminal
alias web='cd /var/www/html' changes directory to html edit directory

2. Edit your ~/.bashrc file and add the chosen aliases / functions from step 1.
   In order to edit the bashrc file, what I did was I used the command in the terminal
   nano ~/.bashrc
   This opens the bashrc directory to be able to edit and make changes to.
   ![image](https://github.com/user-attachments/assets/afbe19ec-2eb7-4f89-ac65-1a04e08ee851)

   3. Verify your added aliases / bash additions work by running source <filename> - install additional packages if required
      Using ChatGPT to help me figure out which command I need to use to determine whether the aliases I added work or not I ran source ~/.bashrc (solution obtained from ChatGPT)
      ![image](https://github.com/user-attachments/assets/6f7be2ab-1551-43fc-a828-fd1c111312b1)
      ![image](https://github.com/user-attachments/assets/d732affb-d9f6-446c-9021-8995e933d2
      ![image](https://github.com/user-attachments/assets/d3442b5f-ad86-4b88-966e-9aee1da0ba4b)
      ![image](https://github.com/user-attachments/assets/3757aa02-3d5f-4b80-ac4e-e1c51091e7f1)
      ![image](https://github.com/user-attachments/assets/3c1c2f83-ffa1-4a39-9040-e7d323d094ae)

4. Write a script that:copies or symbolically links the .bashrc file in your dotfiles repository to your user's home directory yes, this means getting rid of, or better, moving (renaming) the original as a backup, and having the sym link named ~/.bashrc be in its place

   For this step, I also used ChatGPT
   first, what I did was backup the existing .bashrc, to do this, I initiated the script creation
I used nano install.sh this creates the script that I want to perform for this step.
I then obtained the code that I wanted to use for my script that performs the above actions from ChatGPT
The following code is
#!/bin/bash

# Set path to your dotfiles repository
DOTFILES_DIR="$HOME/dotfiles/homefiles"

# Check if the .bashrc file exists in the home directory
if [ -f "$HOME/.bashrc" ]; then
    # Backup the existing .bashrc file
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
    echo "Backup of .bashrc created as .bashrc.bak"
fi

# Create a symbolic link to the .bashrc from the dotfiles repository
ln -s "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# Prompt the user to reload their environment
echo "Installation complete. The .bashrc file has been updated."
echo "Please run the following to reload your environment:"
echo "source ~/.bashrc"
echo "Alternatively, log out and log back in to apply the changes."
to make the script executable I gave it a chmod command with +x to signify that the script is an executable 
chmod +x instal.sh
then I ran the script
![image](https://github.com/user-attachments/assets/e411f193-ec9d-44f7-bd2c-383c07489b5a)
According to chatgpt, to determine whether the .bashrc has a symbolic link is using a ls -l /.bashrc I can see that there is lrwx etc the l signifies that there is a symbolic link
![image](https://github.com/user-attachments/assets/a190942f-5081-4b8f-87c2-11e180574df8)
also in the directory there is an arrow on the file that shows that it is also a symbolic link
![image](https://github.com/user-attachments/assets/d231c55c-a723-4e0e-a4a0-0d0a75758673)
The script also informs the user that reloading and rentering the environment is the easiest way to have the changes go into effect
ln -s "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc" creates a symbolic link to the home directory, any changes that are made to the .bashrc file will be replicated to the filed in the home directory
mv "$HOME/.bashrc" "$HOME/.bashrc.bak" creates a backup in the home directory to have a copy of the original bash file and an edited copy of the bash file. 
THIS ENTIRE STEP WAS SOURCED USING CHATGPT AT https://chatgpt.com/



   
      



