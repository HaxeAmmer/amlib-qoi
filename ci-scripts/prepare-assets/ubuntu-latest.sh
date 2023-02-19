#!/bin/bash
mv amlib-qoi/src-haxelib-dev/bin/hl/bin-hl/ammer_qoi.hdll "$CI_ASSET_DIRECTORY/prebuilt-linux-hl.bin"
mv amlib-qoi/src-haxelib-dev/bin/java/bin-java/libammer_qoi.so "$CI_ASSET_DIRECTORY/prebuilt-linux-java.bin"
mv amlib-qoi/src-haxelib-dev/bin/lua/bin-lua/libammer_qoi.so "$CI_ASSET_DIRECTORY/prebuilt-linux-lua.bin"
