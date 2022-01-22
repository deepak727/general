#!/bin/bash

##############################################################################
#Script Name: Mock Script                                                    #
#Description: For changing, hostfile, hostname, ip and routing               #  
#Args       : No Special Argument                                            #  
#Author     : Deepak Singh                                                   #  
#Email      : deepak727@gmail.com                                            #  
##############################################################################

###### Creating backup of Files ######

mkdir /home/changeme/mock  ##change the home directory.
cp /etc/hosts /home/changeme/mock/
cp /etc/sysconfig/network-scripts/ifcfg-ens160  /home/changeme/mock/ 
cp /etc/sysconfig/network-scripts/ifcfg-ens192  /home/changeme/mock/
cp /etc/sysconfig/network-scripts/route-ens160  /home/changeme/mock/

###### Changing host file ##############

comm=yprd
uncomm=172.19
filename=/etc/hosts
sed -i -e "/$comm/s/^#*/#/" $filename
sed -i -e "/$uncomm/s/^#//" $filename


###### Changing ifcfg file ##############

comm=172.31
uncomm=172.19
filename=/etc/sysconfig/network-scripts/ifcfg-ens160
sed -i -e "/$comm/s/^#*/#/" $filename
sed -i -e "/$uncomm/s/^#//" $filename


comm=172.31
uncomm=172.19
filename=/etc/sysconfig/network-scripts/ifcfg-ens192
sed -i -e "/$comm/s/^#*/#/" $filename
sed -i -e "/$uncomm/s/^#//" $filename

###### Change in Route #############

comm=172.31
uncomm=172.19
filename=/etc/sysconfig/network-scripts/route-ens160
sed -i "s/^#//;t;s/^./#&/" $filename


##### Change Hostname ###########

hostnamectl set-hostname myhostname

# Restart Network services #######

service network restart

#echo $(ip a)
#echo $(route -n)

