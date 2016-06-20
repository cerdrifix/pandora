#!/bin/bash

ERL_VER=`erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell`

if [ $ERL_VER > "18" ]; then
	APP_PATH=libs/Emysql18
else
	APP_PATH=libs/Emysql17
fi;

echo "Using app path: $APP_PATH"

erlc db.erl
erlc players.erl
erl -pa $APP_PATH -s players run -s init stop -noshell
