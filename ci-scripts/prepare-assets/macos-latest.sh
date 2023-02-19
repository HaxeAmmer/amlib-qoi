#!/bin/bash
mv amlib-qoi/src-haxelib-dev/bin/hl/bin-hl/ammer_qoi.hdll "$CI_ASSET_DIRECTORY/prebuilt-mac-hl.bin"
mv amlib-qoi/src-haxelib-dev/bin/java/bin-java/libammer_qoi.dylib "$CI_ASSET_DIRECTORY/prebuilt-mac-java.bin"
mv amlib-qoi/src-haxelib-dev/bin/lua/bin-lua/libammer_qoi.dylib "$CI_ASSET_DIRECTORY/prebuilt-mac-lua.bin"
