# Step 01: Commit Workflow Scaffolding

## Goal

Implement the commit workflow scaffolding described in the main transition plan.

## Scope

- create `scripts/commit.sh`
- keep using `plan/current_commit_message` as the predefined commit message file
- support conventional commit messages with optional `Co-authored-by` trailers

## Script Behavior

The script should:

1. read and show the content of `plan/current_commit_message`
2. ask whether the predefined message should be used as-is
3. if accepted, run `git commit -F plan/current_commit_message`
4. if not accepted, run `git commit -t plan/current_commit_message`
5. forward any additional arguments to `git commit`
6. delete `plan/current_commit_message` after a successful commit

## Notes

- Keep the script minimal and non-interactive except for the confirmation
  question.
- Preserve commit trailers already written in `plan/current_commit_message`.
- The prompt should default to using the predefined message.
