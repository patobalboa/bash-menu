#!/bin/bash

# This script is used to create a menu for administartion tasks with submenus.

# The first menu is the main menu, which is used to select the submenus.
# The second menu is the submenu, which is used to select the tasks.

# The script is written in a way that it can be used for multiple submenus.
# Define the submenus in the array SUBMENUS.



# Define the submenus
SUBMENUS=( "System" "Network" "Users" "Services" "Exit" )

# Define the tasks for the submenus
SYSTEM=( "System Info" "Disk Usage" "Memory Usage" "Show Process" "Exit" )
NETWORK=( "Network Info" "Network Usage" "Modify IP" "Exit" )
USERS=("List Users" "Add User" "Modify User" "Delete User" "Who is connected" "Exit" )
SERVICES=( "Service Info" "Service Usage" "Show specific process" "Kill Process" "Start Service" "Restart Service" "Stop Service" "Exit" )

# Define the functions for the tasks
function system_info {
    echo "System Info"

    # Show the system info
    uname -a

}

function disk_usage {
    echo "Disk Usage"

    # Show the disk usage
    df -h
}

function memory_usage {
    echo "Memory Usage"

    # Show the memory usage
    free -m
}

function show_process {
    echo "Show Process in live"

    # Show the process in live
    top
}

function network_info {
    echo "Network Info"

    # Show the network info
    ifconfig
}

function network_usage {
    echo "Network Usage"

    # Show the network usage
    netstat -tulpn
}

function modify_ip {
    echo "Modify IP"

    # Modify the IP
    echo "Enter the interface name: "
    read interface
    echo "Enter the new IP: "
    read ip
    echo "Enter the new netmask: "
    read netmask
    echo "Enter the new gateway: "
    read gateway

    # Set the new IP
    ifconfig $interface $ip netmask $netmask
    route add default gw $gateway

    # Restart the network
    /etc/init.d/networking restart
}

function add_user {
    echo "Add User"

    # Add a user
    read -p "Enter the username: " username
    useradd $username
}

function modify_user {
    echo "Modify User"

    # Modify a user
    read -p "Enter the username: " username
    passwd $username
}

function delete_user {
    echo "Delete User"

    # Delete a user
    read -p "Enter the username: " username
    userdel $username
}

function list_users {
    echo "List Users"

    # List the users
    cat /etc/passwd
}

function who_is_connected {
    echo "Who is connected"

    # Show who is connected
    who
}



function service_info {
    echo "Service Info"

    # Show the service info
    service --status-all
}

function service_usage {
    echo "Service Usage"

    # Show the service usage
    ps -ef
}

function show_specific_process {
    echo "Show specific process"

    # Show a specific process
    read -p "Enter the process name: " process
    ps -ef | grep $process
}

function kill_process {
    echo "Kill Process"

    # Kill a process
    read -p "Enter the process name: " process
    killall $process
}

function start_service {
    echo "Start Service"

    # Start a service
    read -p "Enter the service name: " service
    service $service start
}

function restart_service {
    echo "Restart Service"

    # Restart a service
    read -p "Enter the service name: " service
    service $service restart
}

function stop_service {
    echo "Stop Service"

    # Stop a service
    read -p "Enter the service name: " service
    service $service stop
}

# Define the main menu

# Show the main menu
echo "Main Menu"
echo "========="
echo "Select a submenu:"
for (( i=0; i<${#SUBMENUS[@]}; i++ )); do
    echo "$i) ${SUBMENUS[$i]}"
done

# Read the input
read -p "Enter your choice: " choice

# Check the input

# If the input is not a number, show an error message
if ! [[ $choice =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid input"
    exit 1
fi

# If the input is not in the range of the array, show an error message
if [ $choice -lt 0 ] || [ $choice -gt ${#SUBMENUS[@]} ]; then
    echo "Error: Invalid input"
    exit 1
fi

# If the input is 4, exit the script
if [ $choice -eq 4 ]; then
    echo "Bye"
    exit 0
fi

# Define the submenu

# Show the submenu
echo "Submenu: ${SUBMENUS[$choice]}"
echo "========="
echo "Select a task:"
for (( i=0; i<${#SUBMENUS[@]}; i++ )); do
    echo "$i) ${!SUBMENUS[$choice]}[$i]"
done

# Read the input
read -p "Enter your choice: " choice

# Check the input

# If the input is not a number, show an error message
if ! [[ $choice =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid input"
    exit 1
fi

# If the input is not in the range of the array, show an error message
if [ $choice -lt 0 ] || [ $choice -gt ${#SUBMENUS[@]} ]; then
    echo "Error: Invalid input"
    exit 1
fi

# If the input is 4, exit the script
if [ $choice -eq 4 ]; then
    echo "Bye"
    exit 0
fi

# Call the function
${!SUBMENUS[$choice]}[$choice]

# Exit the script
exit 0



# Define the exit function
function exit {
    echo "Exit"

    # Exit the script
    exit 0
}
