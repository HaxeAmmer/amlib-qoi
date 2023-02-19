#!/bin/bash
mv "$CI_BAKE_DIRECTORY/bin/hl/bin-hl/ammer_qoi.hdll" "$CI_ASSET_DIRECTORY/prebuilt-linux-hl.bin"
mv "$CI_BAKE_DIRECTORY/bin/java/bin-java/libammer_qoi.so" "$CI_ASSET_DIRECTORY/prebuilt-linux-java.bin"
mv "$CI_BAKE_DIRECTORY/bin/lua/bin-lua/libammer_qoi.so" "$CI_ASSET_DIRECTORY/prebuilt-linux-lua.bin"
