#!/bin/bash

# This script is used to create a menu for administartion tasks with submenus.

# The first menu is the main menu, which is used to select the submenus.
# The second menu is the submenu, which is used to select the tasks.

# The script is written in a way that it can be used for multiple submenus.
# Define the submenus in the array SUBMENUS.



# Define the submenus
SUBMENUS=( "System" "Network" "Users" "Services" "Exit" )

# Define the tasks for the submenus
SYSTEM=( "System Info" "Disk Usage" "Memory Usage" "Show Process" "Back Main Menu" "Exit" )
NETWORK=( "Network Info" "Network Usage" "Modify IP" "Back Main Menu"  "Exit" )
USERS=("List Users" "Add User" "Modify User" "Delete User" "Who is connected" "Back Main Menu"  "Exit" )
SERVICES=( "Service Info" "Service Usage" "Show specific process" "Kill Process" "Start Service" "Restart Service" "Stop Service" "Back Main Menu" "Exit" )

# Define the functions for the tasks
function system_info {
    echo "System Info"

    # Show the system info
    uname -a
    main_menu

}

function disk_usage {
    echo "Disk Usage"

    # Show the disk usage
    df -h
    main_menu
}

function memory_usage {
    echo "Memory Usage"

    # Show the memory usage
    free -m
    main_menu
}

function show_process {
    echo "Show Process in live"

    # Show the process in live
    top
    main_menu
}

function network_info {
    echo "Network Info"

    # Show the network info
    ifconfig
    main_menu
}

function network_usage {
    echo "Network Usage"

    # Show the network usage
    netstat -tulpn
    main_menu
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
    main_menu
}

function add_user {
    echo "Add User"

    # Add a user
    read -p "Enter the username: " username
    useradd $username
    main_menu
}

function modify_user {
    echo "Modify User"

    # Modify a user
    read -p "Enter the username: " username
    passwd $username
    main_menu
}

function delete_user {
    echo "Delete User"

    # Delete a user
    read -p "Enter the username: " username
    userdel $username
    main_menu
}

function list_users {
    echo "List Users"

    # List the users
    cat /etc/passwd
    main_menu
}

function who_is_connected {
    echo "Who is connected"

    # Show who is connected
    who
    main_menu
}



function service_info {
    echo "Service Info"

    # Show the service info
    service --status-all
    main_menu
}

function service_usage {
    echo "Service Usage"

    # Show the service usage
    ps -ef
    main_menu
}

function show_specific_process {
    echo "Show specific process"

    # Show a specific process
    read -p "Enter the process name: " process
    ps -ef | grep $process
    main_menu
}

function kill_process {
    echo "Kill Process"

    # Kill a process
    read -p "Enter the process name: " process
    killall $process
    main_menu
}

function start_service {
    echo "Start Service"

    # Start a service
    read -p "Enter the service name: " service
    service $service start
    main_menu
}

function restart_service {
    echo "Restart Service"

    # Restart a service
    read -p "Enter the service name: " service
    service $service restart

    main_menu
}

function stop_service {
    echo "Stop Service"

    # Stop a service
    read -p "Enter the service name: " service
    service $service stop
    main_menu
}

# Define function for back to main menu.
function back_main_menu {
    
    # Call the main menu
    main_menu

}


# Define function for the main menu

function main_menu {

    # Clear the screen if the script is run for the first time.
    if [ $first_run -eq 1 ]; then
        clear
    fi

    # Show the main menu
    echo "Main Menu"
    echo "Select a submenu:"

    # Show the submenus
    for (( i=0; i<${#SUBMENUS[@]}; i++ )); do
        echo "$((i+1)) - ${SUBMENUS[$i]}"
    done

    # Read the input
    read -p "Enter your choice: " choice

    # Call the submenu
    case $choice in
        1) system_menu ;;
        2) network_menu ;;
        3) users_menu ;;
        4) services_menu ;;
        5) exit ;;
        *) echo "Invalid choice" && sleep 2 && main_menu ;;
    esac
}

# Define function for the system submenu

function system_menu {

    # Clear the screen
    clear

    # Show the system submenu
    echo "System Menu"
    echo "Select a task:"

    # Show the tasks
    for (( i=0; i<${#SYSTEM[@]}; i++ )); do
        echo "$((i+1)) - ${SYSTEM[$i]}"
    done

    # Read the input
    read -p "Enter your choice: " choice

    # Call the task
    case $choice in
        1) system_info ;;
        2) disk_usage ;;
        3) memory_usage ;;
        4) show_process ;;
        5) back_main_menu ;;
        6) exit ;;
        *) echo "Invalid choice" && sleep 2 && system_menu ;;
    esac
}

# Define function for the network submenu

function network_menu {

    # Clear the screen
    clear

    # Show the network submenu
    echo "Network Menu"
    echo "Select a task:"

    # Show the tasks
    for (( i=0; i<${#NETWORK[@]}; i++ )); do
        echo "$((i+1)) - ${NETWORK[$i]}"
    done

    # Read the input
    read -p "Enter your choice: " choice

    # Call the task
    case $choice in
        1) network_info ;;
        2) network_usage ;;
        3) modify_ip ;;
        4) back_main_menu ;;
        5) exit ;;
        *) echo "Invalid choice" && sleep 2 && network_menu ;;
    esac
}

# Define function for the users submenu

function users_menu {

    # Clear the screen
    clear

    # Show the users submenu
    echo "Users Menu"
    echo "Select a task:"

    # Show the tasks
    for (( i=0; i<${#USERS[@]}; i++ )); do
        echo "$((i+1)) - ${USERS[$i]}"
    done

    # Read the input
    read -p "Enter your choice: " choice

    # Call the task
    case $choice in
        1) add_user ;;
        2) modify_user ;;
        3) delete_user ;;
        4) list_users ;;
        5) who_is_connected ;;
        6) back_main_menu ;;
        7) exit ;;
        *) echo "Invalid choice" && sleep 2 && users_menu ;;
    esac
}

# Define function for the services submenu

function services_menu {

    # Clear the screen
    clear

    # Show the services submenu
    echo "Services Menu"
    echo "Select a task:"

    # Show the tasks
    for (( i=0; i<${#SERVICES[@]}; i++ )); do
        echo "$((i+1)) - ${SERVICES[$i]}"
    done

    # Read the input
    read -p "Enter your choice: " choice

    # Call the task
    case $choice in
        1) service_info ;;
        2) service_usage ;;
        3) show_specific_process ;;
        4) kill_process ;;
        5) start_service ;;
        6) restart_service ;;
        7) stop_service ;;
        8) back_main_menu ;;
        9) exit ;;
        *) echo "Invalid choice" && sleep 2 && services_menu ;;
    esac
}

# Call the main menu
main_menu

# Set the first run variable to 0
first_run=0

# End of script

