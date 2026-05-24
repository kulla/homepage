#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
MESSAGE_FILE="$REPO_ROOT/plan/current_commit_message"

if [ ! -f "$MESSAGE_FILE" ]; then
  printf 'Missing commit message file: %s\n' "$MESSAGE_FILE" >&2
  exit 1
fi

git -C "$REPO_ROOT" commit -F "$MESSAGE_FILE" "$@"

rm "$MESSAGE_FILE"
