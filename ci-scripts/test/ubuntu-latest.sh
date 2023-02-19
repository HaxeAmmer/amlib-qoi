#!/bin/bash

echo "hl ..."
haxe build/build-hl.hxml
LD_LIBRARY_PATH=bin/hl hl bin/hl/out.hl

echo "java ..."
haxe build/build-java.hxml
java -Djava.library.path=bin/java -jar bin/java/Main.jar

echo "lua ..."
haxe build/build-lua.hxml
LD_LIBRARY_PATH=bin/lua lua bin/lua/out.lua
