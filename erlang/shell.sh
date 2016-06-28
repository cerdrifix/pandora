#!/bin/bash

#ERL_VER=`awk -F, 'NR==1 {gsub(/"/,"",$3);print $3}' "$(dirname $(readlink -f $(which erl)))/../releases/RELEASES"`

#if [ $ERL_VER -eq 18 ]; then
#	APP_PATH=libs/Emysql18
#else
#	APP_PATH=libs/Emysql17
#fi;

#erl -pa $APP_PATH -name lx@cerdriNet -mnesia dir '"./db/Mnesia.Support"'
erl -pa libs/Emysql17 -name lx@cerdriNet -mnesia dir '"./db/Mnesia.Support"'