#!/bin/sh
# Script for ServerBox app v1.0.877
# DO NOT delete this file while app is running

export LANG=en_US.UTF-8

# If macSign & bsdSign are both empty, then it's linux
macSign=$(uname -a 2>&1 | grep "Darwin")
bsdSign=$(uname -a 2>&1 | grep "BSD")

# Link /bin/sh to busybox?
isBusybox=$(ls -l /bin/sh | grep "busybox")

userId=$(id -u)

status() {
	if [ "$macSign" = "" ] && [ "$bsdSign" = "" ]; then
		echo __linux
	echo SrvBoxSep
		date +%s
	echo SrvBoxSep
		cat /proc/net/dev
	echo SrvBoxSep
		cat /etc/*-release | grep PRETTY_NAME
	echo SrvBoxSep
		cat /proc/stat | grep cpu
	echo SrvBoxSep
		uptime
	echo SrvBoxSep
		cat /proc/net/snmp
	echo SrvBoxSep
		df
	echo SrvBoxSep
		cat /proc/meminfo | grep -E 'Mem|Swap'
	echo SrvBoxSep
		cat /sys/class/thermal/thermal_zone*/type
	echo SrvBoxSep
		cat /sys/class/thermal/thermal_zone*/temp
	echo SrvBoxSep
		cat /etc/hostname
	echo SrvBoxSep
		cat /proc/diskstats
	echo SrvBoxSep
		for f in /sys/class/power_supply/*/uevent; do cat "$f"; echo; done
	echo SrvBoxSep
		nvidia-smi -q -x
	echo SrvBoxSep
		sensors -j
	else
		echo __bsd
	echo SrvBoxSep
		date +%s
	echo SrvBoxSep
		netstat -ibn
	echo SrvBoxSep
		uname -or
	echo SrvBoxSep
		top -l 1 | grep "CPU usage"
	echo SrvBoxSep
		uptime
	echo SrvBoxSep
		df -k
	echo SrvBoxSep
		top -l 1 | grep PhysMem
	echo SrvBoxSep
		hostname
	fi

}

process() {
	if [ "$macSign" = "" ] && [ "$bsdSign" = "" ]; then
		if [ "$isBusybox" != "" ]; then
			ps w
		else
			ps -aux
		fi
	else
		ps -ax
	fi
	

}

ShutDown() {
	if [ "$userId" = "0" ]; then
		shutdown -h now
	else
		sudo -S shutdown -h now
	fi

}

Reboot() {
	if [ "$userId" = "0" ]; then
		reboot
	else
		sudo -S reboot
	fi

}

Suspend() {
	if [ "$userId" = "0" ]; then
		systemctl suspend
	else
		sudo -S systemctl suspend
	fi

}

case $1 in
  '-s')
    status
    ;;
  '-p')
    process
    ;;
  '-sd')
    ShutDown
    ;;
  '-r')
    Reboot
    ;;
  '-sp')
    Suspend
    ;;
  *)
    echo "Invalid argument $1"
    ;;
esac