#!/bin/bash

GH_ACTION_PATH="ammer-gh-action"
if [[ ! -e "$GH_ACTION_PATH" ]]; then
    echo "ammer-gh-action directory not found: git clone https://github.com/HaxeAmmer/ammer-gh-action"
    exit 1
fi

TEMPLATE_PATH=`realpath "$GH_ACTION_PATH/templates"`

rm -rf .github/workflows
mkdir -p .github/workflows

pushd .github/workflows-partial
echo "# generated with $0, do not edit directly" > "../workflows/build.yml"
echo "name: Build (all platforms)" >> "../workflows/build.yml"
cat \
    "$TEMPLATE_PATH/header-0.yml" \
    "env.yml" \
    "$TEMPLATE_PATH/header-1/all.yml" \
    "$TEMPLATE_PATH/haxe.yml" \
    "$TEMPLATE_PATH/lib/ammer-core.yml" \
    "$TEMPLATE_PATH/lib/ammer.yml" >> "../workflows/build.yml"
for target in cpp-static cs hl java lua neko nodejs python; do
    cat "$TEMPLATE_PATH/platform-setup/$target.yml" >> "../workflows/build.yml"
done
cat \
    "checkout.yml" \
    "bake.yml" \
    "test.yml" \
    "deploy.yml" >> "../workflows/build.yml"
popd
