#!/bin/bash

ERL_VER=`awk -F, 'NR==1 {gsub(/"/,"",$3);print $3}' "$(dirname $(readlink -f $(which erl)))/../releases/RELEASES"`

if [ $ERL_VER -eq 18 ]; then
	APP_PATH=libs/Emysql18
else
	APP_PATH=libs/Emysql17
fi;

#echo "Using app path: $APP_PATH"

erlc db.erl
erlc utils.erl
erlc players.erl
erlc matches.erl
erl -pa $APP_PATH -s matches run -s init stop -noshell -config pandora.config
