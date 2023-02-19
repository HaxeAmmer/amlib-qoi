#!/bin/bash
mv "$CI_BAKE_DIRECTORY/bin/cs/bin-cs/ammer_qoi.dll" "$CI_ASSET_DIRECTORY/prebuilt-mac-cs.bin"
mv "$CI_BAKE_DIRECTORY/bin/hl/bin-hl/ammer_qoi.hdll" "$CI_ASSET_DIRECTORY/prebuilt-mac-hl.bin"
mv "$CI_BAKE_DIRECTORY/bin/java/bin-java/libammer_qoi.dylib" "$CI_ASSET_DIRECTORY/prebuilt-mac-java.bin"
mv "$CI_BAKE_DIRECTORY/bin/lua/bin-lua/libammer_qoi.dylib" "$CI_ASSET_DIRECTORY/prebuilt-mac-lua.bin"
mv "$CI_BAKE_DIRECTORY/bin/neko/bin-neko/ammer_qoi.ndll" "$CI_ASSET_DIRECTORY/prebuilt-mac-neko.bin"
mv "$CI_BAKE_DIRECTORY/bin/nodejs/bin-nodejs/ammer_qoi.node" "$CI_ASSET_DIRECTORY/prebuilt-mac-nodejs.bin"
mv "$CI_BAKE_DIRECTORY/bin/python/bin-python/ammer_qoi.so" "$CI_ASSET_DIRECTORY/prebuilt-mac-python.bin"
