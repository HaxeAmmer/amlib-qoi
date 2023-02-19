#!/bin/bash

echo "cpp-static ..."
haxe build/build-cpp-static.hxml
bin/cpp-static/out.cpp/Main.exe

echo "cs ..."
haxe build/build-cs.hxml
cp reference.qoi bin/cs/reference.qoi
pushd bin/cs
out.cs/bin/Main.exe
popd

echo "hl ..."
haxe build/build-hl.hxml
cp reference.qoi bin/hl/reference.qoi
pushd bin/hl
hl out.hl
popd

echo "java ..."
haxe build/build-java.hxml
cp reference.qoi bin/java/reference.qoi
pushd bin/java
java -jar Main.jar
popd

echo "neko ..."
haxe build/build-neko.hxml
cp reference.qoi bin/neko/reference.qoi
pushd bin/neko
neko out.n
popd

echo "nodejs ..."
haxe build/build-nodejs.hxml
cp reference.qoi bin/nodejs/reference.qoi
pushd bin/nodejs
node out.js
popd

echo "python ..."
haxe build/build-python.hxml
cp reference.qoi bin/python/reference.qoi
pushd bin/python
python3 out.py
popd


echo "lua ..."
haxe build/build-lua.hxml
cp reference.qoi bin/lua/reference.qoi
pushd bin/lua
export LUA_CPATH='!'"\?.dll;$LUA_CPATH"
lua out.lua
popd
