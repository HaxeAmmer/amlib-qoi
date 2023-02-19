#!/bin/bash
mv "$CI_BAKE_DIRECTORY/bin/hl/bin-hl/ammer_qoi.hdll" "$CI_ASSET_DIRECTORY/prebuilt-mac-hl.bin"
mv "$CI_BAKE_DIRECTORY/bin/java/bin-java/libammer_qoi.dylib" "$CI_ASSET_DIRECTORY/prebuilt-mac-java.bin"
mv "$CI_BAKE_DIRECTORY/bin/lua/bin-lua/libammer_qoi.dylib" "$CI_ASSET_DIRECTORY/prebuilt-mac-lua.bin"
