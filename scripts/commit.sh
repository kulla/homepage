#!/usr/bin/env bash

set -eu

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)
MESSAGE_FILE="$REPO_ROOT/plan/current_commit_message"

if [ ! -f "$MESSAGE_FILE" ]; then
  printf 'Missing commit message file: %s\n' "$MESSAGE_FILE" >&2
  exit 1
fi

printf 'Using predefined commit message from %s:\n\n' "plan/current_commit_message"
cat "$MESSAGE_FILE"
printf '\nUse this message as-is? [Y/n] '
read -r response

case "$response" in
  '' | [Yy] | [Yy][Ee][Ss])
    git -C "$REPO_ROOT" commit -F "$MESSAGE_FILE" "$@"
    ;;
  *)
    git -C "$REPO_ROOT" commit -t "$MESSAGE_FILE" "$@"
    ;;
esac

rm "$MESSAGE_FILE"
