{application,mysql_client,
             [{description,"MySQL native client"},
              {vsn,"1.2.8"},
              {modules,[conn_srv,connection,connection_factory,cursor,
                        datasource,helper_common,helper_connection,
                        helper_statement,io_send_cmd,io_socket,my,
                        packet_parser,packet_parser_binary,
                        packet_parser_string,packet_response]},
              {registered,[datasource_sup]},
              {applications,[kernel,stdlib]},
              {mod,{my,[]}},
              {env,[]}]}.