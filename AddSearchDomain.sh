#!/bin/bash

### array to add your own search domain ###
searchDomains=(your.domain.1 your.domain.2 your.domain.3) # replace 'your.domain.1... 2... 3' with your own domain.  You can have fewer or more as needed

serviceList=( $(networksetup -listallnetworkservices) ) # looks for available interfaces on MacBook (Wi-Fi, Ethernet, USB, Bluetooth, etc...)

### for loop that cycles through each interface that has been seen by mac book ###
for interface in "${serviceList[@]}";
do

  result=$(networksetup -setsearchdomains "${interface}" "${searchDomains[@]}") # for each interface that has been detected, adds the search domain from the array in line 13

  if result="An asterisk (*) denotes that a network service is disabled. is not a recognized network service."; then

    return > /dev/null 2>&1

  else

    return "$result"

  fi

done

exit
