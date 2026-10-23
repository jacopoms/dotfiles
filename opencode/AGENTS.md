# Global orchestration policy

Applies to every project. A project's own `AGENTS.md` takes precedence for
stack, conventions, and commands; this file only decides *who* does the work.
These rules address the primary agent — subagents execute the task they are
given and never delegate further.

## Routing

- **Any file edit** — create, modify, delete: hand it to the `code-writer`
  subagent. Do not edit files yourself.
- **The OpenCode harness itself** (`opencode.jsonc`, `agents/`, `commands/`,
  this file): edit these yourself; do not delegate.
- **Review**: `code-reviewer` (read-only). Only when I ask for a review or
  before a commit/tag — not after every edit.
- **Hard design problems**: `thinker` (read-only, no tools). Only after two
  failed attempts, or for a real trade-off. Send it a self-contained summary.
- **In the `plan` agent**: do not delegate edits. Produce the plan; I will run
  it.

## Delegation

- One short plan first: files, approach, verification command.
- The delegation prompt must be self-contained: task, relevant paths,
  acceptance criteria, verification command. Subagents start with fresh
  context and cannot see this conversation.
- One subagent at a time; never in parallel. Do not run one in the background
  unless I ask.
- If a subagent fails twice, stop and report — do not retry in a loop.

## Cost (local models)

`code-writer` runs the same model as you, so delegating costs no model swap.
`code-reviewer` and `thinker` run different models and force a swap: use them
on purpose, not by reflex.

## Done

Never report success without the project's own verification (tests, lint,
typecheck) actually run. End with one line naming which agents ran and what
each produced.
