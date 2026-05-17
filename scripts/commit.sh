#!/usr/bin/env bash

set -eu

script_dir=$(dirname "$0")
repo_root=$(cd "$script_dir/.." && pwd)
message_file="$repo_root/plan/current_commit_message"

if [ ! -f "$message_file" ]; then
  printf 'Missing commit message file: %s\n' "$message_file" >&2
  exit 1
fi

printf 'Using predefined commit message from %s:\n\n' "plan/current_commit_message"
cat "$message_file"
printf '\nUse this message as-is? [Y/n] '
read -r response

case "$response" in
  '' | [Yy] | [Yy][Ee][Ss])
    git -C "$repo_root" commit -F "$message_file" "$@"
    ;;
  *)
    git -C "$repo_root" commit -t "$message_file" "$@"
    ;;
esac

rm "$message_file"
