#!/bin/bash
set -efuxo pipefail

DIR="$(dirname "$(readlink -f "$0")")/rust-errors"

TAG='brownbags'
docker build -t "$TAG" .
docker run -ti -v "$DIR:/project" "$TAG" 