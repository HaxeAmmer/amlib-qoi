#!/bin/bash
mv "$CI_BAKE_DIRECTORY/bin/cs/bin-cs/ammer_qoi.dll" "$CI_ASSET_DIRECTORY/prebuilt-win-cs.bin"
mv "$CI_BAKE_DIRECTORY/bin/hl/bin-hl/ammer_qoi.hdll" "$CI_ASSET_DIRECTORY/prebuilt-win-hl.bin"
mv "$CI_BAKE_DIRECTORY/bin/java/bin-java/ammer_qoi.dll" "$CI_ASSET_DIRECTORY/prebuilt-win-java.bin"
mv "$CI_BAKE_DIRECTORY/bin/lua/bin-lua/ammer_qoi.dll" "$CI_ASSET_DIRECTORY/prebuilt-win-lua.bin"
mv "$CI_BAKE_DIRECTORY/bin/neko/bin-neko/ammer_qoi.ndll" "$CI_ASSET_DIRECTORY/prebuilt-win-neko.bin"
mv "$CI_BAKE_DIRECTORY/bin/nodejs/bin-nodejs/ammer_qoi.node" "$CI_ASSET_DIRECTORY/prebuilt-win-nodejs.bin"
mv "$CI_BAKE_DIRECTORY/bin/python/bin-python/ammer_qoi.pyd" "$CI_ASSET_DIRECTORY/prebuilt-win-python.bin"
