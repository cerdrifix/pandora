-module(specialities).
-export([get/0, get/1, print/0]).
-include("records.hrl").

%% Used to manage specialities definitions

get() ->
	Result = db:get(<<"SELECT id, description FROM SPECIALITIES">>),
	Items = emysql:as_record(Result, speciality, record_info(fields, speciality)),
	Items.

get(Key) ->
	Result = db:get(<<"SELECT id, description FROM SPECIALITIES WHERE id = ?">>, [Key]),
	Items = emysql:as_record(Result, speciality, record_info(fields, speciality)),
	Items.

print() ->
	Items = specialities:get(),
	[begin
		io:format("speciality: ~p, ~p~n", [Item#speciality.id, Item#speciality.description])
	end || Item <- Items],
	ok.