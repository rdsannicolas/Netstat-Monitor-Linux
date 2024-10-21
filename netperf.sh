#!/bin/bash
# netperf--Analyzes the netstat running performance log, 
# identifying important results and trends.

logfile="/home/roland/.netstatlog"		# Change for your local configuration.
stats="/tmp/netperf.stats.$$"
awktmp="/tmp/netperf.awk.$$"

trap "$(which rm) -f $awktmp $stats" 0