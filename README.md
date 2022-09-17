# Bash-Menu

## Description

This is a bash script that allows you admin your server with a menu.
<<<<<<< HEAD
This script is for users who are not familiar with the command line.
=======
>>>>>>> 7705c48698402bb06660c8d9d3a9d39b8e8639f7


## Instructions

<<<<<<< HEAD
  Create a new user and add it to the sudo group (sudoers) without password.
=======
Create a new user and add it to the sudo group (sudoers).
>>>>>>> 7705c48698402bb06660c8d9d3a9d39b8e8639f7
    
    ```bash
    useradd -m -G sudo -s /bin/bash username
    ```
<<<<<<< HEAD

  Asign a password to the new user.
    
    ```bash
    passwd username
    ```

  Clone the repository.
    
    ```bash
    git clone https://github.com/patobalboa/bash-menu.git
    ```

  Change permissions.
    
    ```bash
    chmod +x bash-menu/menu.sh
    ```
  
  Modify bashrc file for run the script at login.
    
    ```bash
    echo "bash /home/username/bash-menu/menu.sh" >> /home/username/.bashrc
    ```
  
  Now you can login with the new user and execute the script.
    
    ```bash
    ssh username@ip
    ```
  

=======
Asign a password to the new user.
    
    ```bash
    passwd username
    ```
    
Clone the repository.
    
    ```bash
    git clone https://github.com/patobalboa/bash-menu.git
    ```

Change permissions.
    
    ```bash
    chmod +x bash-menu/menu.sh
    ```

Make the script run at the user's login as sudo.

    ```bash
    echo "bash /home/username/bash-menu/menu.sh" >> /home/username/.bashrc
    ```

Test the script.

    ```bash
    su - username
    ```

>>>>>>> 7705c48698402bb06660c8d9d3a9d39b8e8639f7

## Powered by

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www.codeplus.cl/wp-content/uploads/2022/06/codeplus_blanco_06.png">
  <source media="(prefers-color-scheme: light)" srcset="https://www.codeplus.cl/wp-content/uploads/2022/09/codeplus_06.png">
  <img alt="CodePlus.cl" src="https://www.codeplus.cl/wp-content/uploads/2022/06/codeplus_blanco_06.png">
</picture>
<<<<<<< HEAD

=======
>>>>>>> 7705c48698402bb06660c8d9d3a9d39b8e8639f7
