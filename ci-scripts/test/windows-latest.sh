#!/bin/bash

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

echo "lua ..."
haxe build/build-lua.hxml
cp reference.qoi bin/lua/reference.qoi
pushd bin/lua
export LUA_CPATH='!'"\?.dll;$LUA_CPATH"
lua out.lua
popd
