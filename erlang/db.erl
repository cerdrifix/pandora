-module(db).
-export([getPool/0, get/1, get/2]).

-include("include/records.hrl").

getPool() ->
	application:start(sasl),
	crypto:start(),
	application:start(emysql),
	emysql:add_pool(pool, [
		{ size,		1 				},
		{ user,		"root" 			},
		{ password,	"bill2kill" 	},
		{ host, 	"localhost" 	},
		{ port, 	3306 			},
		{ database,	"matterhorn" 	},
		{ encoding,	utf8 			}
	]),
	pool.

get(Query, Params) ->
	Pool = db:getPool(),
	emysql:prepare(stmt, Query),
	Result = emysql:execute(Pool, stmt, Params),
	Result.

get(Query) ->
	db:get(Query, []).