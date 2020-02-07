#!/bin/bash

# This script allows you to automatically configure search domains for any network
# service located in Network Prferences.  You can configure one, or multiple
# search domains in the searchDomain array.  The for loop will then cycle through
# the network services that the MacBook has perviously connected to and add these
# domains to the Search Domain filed in Network Services > Advanced... > Search Domain.
# Script was tested and has worked locally, as well as with AirWatch MDM for Macs.

# By John Hawkins | johnhawkins3d@gmail.com

### array to add your own search domain ###
searchDomains=(your.domain.1 your.domain.2 your.domain.3) # replace 'your.domain.1... 2... 3' with your own domain.  You can have fewer or more as needed

serviceList=( $(networksetup -listallnetworkservices) ) # looks for available interfaces on MacBook (Wi-Fi, Ethernet, USB, Bluetooth, etc...)

### for loop that cycles through each interface that has been seen by mac book ###
for interface in "${serviceList[@]}";
do

  result=$(networksetup -setsearchdomains "${interface}" "${searchDomains[@]}") # for each interface that has been detected, adds the search domain from the array in line 3

  if result="An asterisk (*) denotes that a network service is disabled. is not a recognized network service."; then

    return > /dev/null 2>&1

  else

    return "$result"

  fi

done

exit
