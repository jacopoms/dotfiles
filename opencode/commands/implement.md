---
description: Plan a change, then delegate every edit to the code-writer subagent
agent: build
---

Task: $ARGUMENTS

1. Inspect the repo just enough to confirm the stack, the relevant files, and
   the project's verification command (tests/lint/typecheck).
2. Write a short plan: files to touch, approach, and how we will verify.
3. Delegate the implementation to the `code-writer` subagent in one
   self-contained prompt: the plan, the acceptance criteria, and the
   verification command.
4. Confirm it actually ran the verification, then report the outcome.

Do not edit files yourself. Do not run a review unless I ask for one.
