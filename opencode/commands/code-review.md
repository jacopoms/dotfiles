---
description: Review current changes with the read-only code-reviewer subagent
agent: build
---

Use the `code-reviewer` subagent to review this target (empty means the current
uncommitted changes): $ARGUMENTS

If no target was given, tell it to run `git diff` and `git diff --staged` and
review only those files. Relay its findings by severity with file:line
references. Do not edit anything and do not fix the findings unless I ask.
