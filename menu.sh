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

# Define function for back to main menu.
function back_ {
    
    # Call the main menu
    main_menu

}

  




# Define function for the main menu

function main_menu {

    # Clear the screen
    clear

echo "                    g╬▓@╖                        ,▄,"
echo "                  ,▓╢╢╢╢╢[                       ███"
echo "       ,╥m╦╓, ,,▄▄▒▒▒▒╢╢▓    ,,,,          ,,,   ███      ,,,,"
echo "      ]▒▒▒▒╣▒▄█████████  ,█████████▄    ▄███████▄███   ▄████████▄      ╔@@N"
echo "      └╢▒▒▒▒███▀    '▀▀ ▄██▀     ▀███  ███▀     ████  ███▀    ▀██▌     ▓╢╢╢,"
echo "        ╙╣▐██▌         ███       ▐██▌j██▌       ███  ███▄▄▄▄▄▄███ ▓▓▓╣╣╢╢╢╣╣▒╣"
echo "           ▐███         ███▒▓W    ███U ███      ,███  ███''''''''   ▀▀▀▓╢╢╢╜╙╜"
echo "            ▀███▄▄▄▄▄██╗▒█████▄▄▄███▀  ╙███▄▄▄▄█████   ███▄▄,▄▄██      ╫╢╢╣"
echo "            ╣▒▒▀█████▀╜╜╨▓▒▀████▀▀└      ▀▀▀██▀▀ ▀▀▀     ▀▀███▀▀"
echo "           ╫╢╢╢╢╢╢╜         ▓▌"
echo "           └╬╢╢╢▓'           ╙,"
echo "                              ╣@,"
echo "                             ╫╣╣╣╣▓"
echo "                             ▓╣╣▓▓▓C"
echo "                              ╙▓▓▀"
echo "                                ╙"
echo " "
echo " "
echo " "

    echo "===================================="

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
    echo " "
    echo "===================================="
    echo " "

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
        1) system_info && sleep 2 && system_menu ;;
        2) disk_usage && sleep 2 && system_menu ;;
        3) memory_usage && sleep 2 && system_menu ;;
        4) show_process && sleep 2 && system_menu ;;
        5) back_main_menu && sleep 2 && system_menu ;;
        6) exit ;;
        *) echo "Invalid choice" && sleep 2 && system_menu ;;
    esac
}

# Define function for the network submenu

function network_menu {

    echo " "
    echo "===================================="
    echo " "

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
        1) network_info && sleep 2 && network_menu ;;
        2) network_usage && sleep 2 && network_menu ;;
        3) modify_ip && sleep 2 && network_menu ;;
        4) back_main_menu && sleep 2 && network_menu ;;
        5) exit ;;
        *) echo "Invalid choice" && sleep 2 && network_menu ;;
    esac
}

# Define function for the users submenu

function users_menu {

    echo " "
    echo "===================================="
    echo " "

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
        1) add_user && sleep 2 && users_menu ;;
        2) modify_user && sleep 2 && users_menu ;;
        3) delete_user && sleep 2 && users_menu ;;
        4) list_users && sleep 2 && users_menu ;;
        5) who_is_connected && sleep 2 && users_menu ;;
        6) back_main_menu && sleep 2 && users_menu ;;
        7) exit ;;
        *) echo "Invalid choice" && sleep 2 && users_menu ;;
    esac
}

# Define function for the services submenu

function services_menu {

    echo " "
    echo "===================================="
    echo " "

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
        1) service_info && sleep 2 && services_menu ;;
        2) service_usage && sleep 2 && services_menu ;;
        3) show_specific_process && sleep 2 && services_menu ;;
        4) kill_process && sleep 2 && services_menu ;;
        5) start_service  && sleep 2 && services_menu;;
        6) restart_service && sleep 2 && services_menu ;;
        7) stop_service && sleep 2 && services_menu ;;
        8) back_main_menu && sleep 2 && services_menu ;;
        9) exit ;;
        *) echo "Invalid choice" && sleep 2 && services_menu ;;
    esac
}

# Call the main menu
main_menu


# End of script

