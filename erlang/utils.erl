-module(utils).
-export([as_record/3]).

-include("include/emysql.hrl").

as_record(Result, RecordName, Fields) when is_atom(RecordName) ->
	[{_, _, Columns, Rows, _}, _] = Result,
	S = lists:seq(1, length(Columns)),
	P = lists:zip([ binary_to_atom(C1#field.name, utf8) || C1 <- Columns ], S),
	F = fun(FieldName) ->
		case proplists:lookup(FieldName, P) of
			none ->
					fun(_) -> undefined end;
			{FieldName, Pos} ->
					fun(Row) -> lists:nth(Pos, Row) end
		end
	end,
	Fs = [ F(FieldName) || FieldName <- Fields ],
	Fun = fun(A) -> A end,
	F1 = fun(Row) ->
		RecordData = [ Fx(Row) || Fx <- Fs ],
		Fun(list_to_tuple([player|RecordData]))
	end,
	[ F1(Row) || Row <- Rows ].
