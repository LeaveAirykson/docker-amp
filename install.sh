#!/bin/bash
damp_rootdir="$(dirname "$(readlink -f "$0")")"

echo "Creating folder structure"

mkdir -vp "$damp_rootdir/vhost"
mkdir -vp "$damp_rootdir/www"
mkdir -vp "$damp_rootdir/mysql"

rm -rf "$damp_rootdir/.git"

cd "$damp_rootdir" && docker compose build

echo "Done"
