#!/bin/bash

echo "cpp-static ..."
haxe build/build-cpp-static.hxml
bin/cpp-static/out.cpp/Main

echo "cs ..."
haxe build/build-cs.hxml
DYLD_LIBRARY_PATH=bin/cs mono bin/cs/out.cs/bin/Main.exe

echo "hl ..."
haxe build/build-hl.hxml
DYLD_LIBRARY_PATH=bin/hl hl bin/hl/out.hl

echo "java ..."
haxe build/build-java.hxml
java -Djava.library.path=bin/java -jar bin/java/Main.jar

echo "lua ..."
haxe build/build-lua.hxml
DYLD_LIBRARY_PATH=bin/lua lua bin/lua/out.lua

echo "neko ..."
haxe build/build-neko.hxml
DYLD_LIBRARY_PATH=bin/neko neko bin/neko/out.n

echo "nodejs ..."
haxe build/build-nodejs.hxml
node bin/nodejs/out.js

echo "python ..."
haxe build/build-python.hxml
python3 bin/python/out.py
