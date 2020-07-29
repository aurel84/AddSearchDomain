#!/bin/bash

# Updates the search domains and dns servers for macOS in Network Preferences > Advanced... > DNS
# Overwrites any current search domain and ip address in this entry, so please include all possible entries
# Applies the search domain and ip addresses to all the network services in Network Preferences
# by John Hawkins | johnhawkins3d@gmail.com

### array to add your own search domain ###
searchDomains=(your.search.domain) # domains go here (replace the temporary one), leave a space between domains
dnsServers=(1.2.3.4) # ip addresses go here (replace the temporary one), leave a space between addresses

IFS=$'\n' # Preserves spaces for network services (e.g. Thunderbolt Bridge)
serviceList=( $(networksetup -listallnetworkservices) ) # Looks for available interfaces on MacBook (Wi-Fi, Ethernet, USB, Bluetooth, etc...)
unset IFS

### For loop that cycles through each interface that has been seen by mac book ###
for interface in "${serviceList[@]}";
do

    networksetup -setsearchdomains "$interface" "${searchDomains[@]}" > /dev/null 2>&1 # For each interface that has been detected, adds the search domain from the array in line 4
    networksetup -setdnsservers "$interface" "${dnsServers[@]}" > /dev/null 2>&1 # For each interface that has been detected, adds the ip address from the array in line 5

done

exit
