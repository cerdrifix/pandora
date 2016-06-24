#!/bin/bash
erl -pa libs/Emysql-master/ebin -name lx@cerdriNet -mnesia dir '"./db/Mnesia.Support"'