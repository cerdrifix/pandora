-module(mh1).
-export([query/1]).

code:add_path("mysql").

run() ->
	init(),
	

init() ->
	my:start_client().
	
get_connection() ->
	my:new_datasource(my_ds, #datasource{
	  host = "localhost",
	  port = 3306,
	  database = "",
	  user = "root",
	  password = "root"
	}),
	datasource:get_connection(my_ds).

query(Query) ->
	Conn = get_connection(),
	