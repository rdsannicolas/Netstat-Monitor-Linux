#!/bin/bash
# getstats--Every 'n' minutes, grabs netstats values (via crontab)

logfile="/home/roland/.netstatlog"		# Change for your local configuration.
temp="/tmp/getstats.$$.tmp"

trap "$(which rm) -f $temp" 0

if [ ! -e $logfile ] ; then				# First time run?
	touch $logfile
fi

( netstat -s -p tcp > $temp

# Check your log file the first time this is run: some versions of netstat
# report more than one line, which is why the "| head -1" is used here.
sent="$(grep 'packets sent' $temp | cut -d\ -f1 | sed \
's/[^[:digit:]]//g' | head -1)"
resent="$(grep 'retransmitted' $temp | cut -d\ -f1 | sed \
's/[^[:digit:]]//g')"

) >> $logfile

exit 0