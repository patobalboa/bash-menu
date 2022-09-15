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

# Check the input and show the submenu or exit the script with a case statement.

case $choice in
    0)
        # Show the submenu
        echo "System Menu"
        echo "==========="
        echo "Select a task:"
        for (( i=0; i<${#SYSTEM[@]}; i++ )); do
            echo "$i) ${SYSTEM[$i]}"
        done

        # Read the input
        read -p "Enter your choice: " choice

        # Check the input and execute the task or exit the script with a case statement.
        case $choice in
            0)
                system_info
                ;;
            1)
                disk_usage
                ;;
            2)
                memory_usage
                ;;
            3)
                show_process
                ;;
            4)
                exit
                ;;
            *)
                echo "Invalid input"
                ;;
        esac
        ;;
    1)
        # Show the submenu
        echo "Network Menu"
        echo "==========="
        echo "Select a task:"
        for (( i=0; i<${#NETWORK[@]}; i++ )); do
            echo "$i) ${NETWORK[$i]}"
        done

        # Read the input
        read -p "Enter your choice: " choice

        # Check the input and execute the task or exit the script with a case statement.
        case $choice in
            0)
                network_info
                ;;
            1)
                network_usage
                ;;
            2)
                modify_ip
                ;;
            3)
                exit
                ;;
            *)
                echo "Invalid input"
                ;;
        esac
        ;;
    2)
        # Show the submenu
        echo "Users Menu"
        echo "==========="
        echo "Select a task:"
        for (( i=0; i<${#USERS[@]}; i++ )); do
            echo "$i) ${USERS[$i]}"
        done

        # Read the input
        read -p "Enter your choice: " choice

        # Check the input and execute the task or exit the script with a case statement.
        case $choice in
            0)
                list_users
                ;;
            1)
                add_user
                ;;
            2)
                modify_user
                ;;
            3)
                delete_user
                ;;
            4)
                who_is_connected
                ;;
            5)
                exit
                ;;
            *)
                echo "Invalid input"
                ;;
        esac
        ;;
    3)
        # Show the submenu
        echo "Services Menu"
        echo "==========="
        echo "Select a task:"
        for (( i=0; i<${#SERVICES[@]}; i++ )); do
            echo "$i) ${SERVICES[$i]}"
        done

        # Read the input
        read -p "Enter your choice: " choice

        # Check the input and execute the task or exit the script with a case statement.
        case $choice in
            0)
                service_info
                ;;
            1)
                service_usage
                ;;
            2)
                show_specific_process
                ;;
            3)
                kill_process
                ;;
            4)
                start_service
                ;;
            5)
                restart_service
                ;;
            6)
                stop_service
                ;;
            7)
                exit
                ;;
            *)
                echo "Invalid input"
                ;;
        esac
        ;;
    4)
        exit
        ;;  
    *)
        echo "Invalid input"
        ;;
esac
