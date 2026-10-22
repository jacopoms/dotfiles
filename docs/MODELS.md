# Local models (Ollama) — what to pull and how it's wired

Machine profile this is tuned for: **MacBook Pro 14" M4 (A3112), 32 GB unified RAM, 10-core GPU**.
macOS caps GPU-wired memory at roughly 2/3 of RAM (~21 GB) by default, and the OS + editors + browsers
eat ~10 GB, so **keep the resident model ≤ 18 GB** and run one model at a time. On this chip dense
models are memory-bandwidth bound (~5–7 tok/s at 27B Q4) while MoE models with 2–3 B active
parameters run 4–6× faster — that is why the picks below mix both.

`opencode.jsonc` no longer hardcodes model ids: it references env vars (`{env:OC_MODEL_*}`) so the same
dotfiles work on every machine. Values live in **`~/.env`** (sourced by `zshrc`, outside the repo).

---

## 1. Pull these

Run in any order; total on disk ≈ 48 GB.

| Model | Size | Used for | Why |
|---|---|---|---|
| Tiel-Coder-35B-A3B (`UD-IQ4_XS`) | 17.7 GB | `OC_MODEL_CODER` | MoE 35B/**3B active** → ~20–30 tok/s here, SWE-bench-Live 12/25 (level with Opus 4.6 medium), smallest KV of any 4-bit tier |
| Dirk = Qwen3.8-27B (`UD-Q4_K_M`) | 16.5 GB | `OC_MODEL_REVIEWER`, `OC_MODEL_THINKER` | best local quality (15/25 SWE-bench-Live) and the terse "Sharp" template makes it ~2.7× faster in wall-clock than stock Qwen3.8 |
| Mellum2.1-12B-A2.5B-Thinking (`Q4_K_M`) | 8.1 GB | lighter reviewer / fallback writer | JetBrains coding model, LiveCodeBench 82.0, SWE-bench Verified 47.0, 2.5B active → 40+ tok/s |
| LFM2.5-8B-A1B | 5.2 GB | `OC_MODEL_SMALL` | purpose-built for fast, reliable tool calling on consumer hardware; replaces the abliterated 1.5B |

```bash
# 1. main coder (MoE, fast). Close Chrome/Brave and use :UD-Q4_K_XL (22.4 GB) instead if you want the extra head-room.
ollama pull hf.co/peculiar-ragdoll/Tiel-Coder-35B-A3B-GGUF:UD-IQ4_XS

# 2. reviewer + thinker (dense 27B, highest quality here)
ollama pull hf.co/peculiar-ragdoll/Dirk-Qwen3.8-27B-GGUF:UD-Q4_K_M

# 3. fast fallback
ollama pull hf.co/JetBrains/Mellum2.1-12B-A2.5B-Thinking-GGUF:Q4_K_M

# 4. small/fast model for titles, summaries, quick subagent work
ollama pull lfm2.5:8b

# optional fast all-rounder (2B active, beats Qwen3.6-35B-A3B on agentic/tool-use)
ollama pull lfm2.5:24b
```

Notes

- Do **not** take the `...-MTP...` tiers (Tiel/Dirk publish one). The speculative head only activates
  with llama.cpp's `--spec-type draft-mtp`; Ollama ignores it, so you would carry ~0.4 GB of dead weight.
  Use the plain repos above.
- If a `:UD-...` tag does not resolve (Ollama's HF tag matching is finicky with `UD-` prefixes), create it
  from the file instead:

  ```bash
  hf download peculiar-ragdoll/Tiel-Coder-35B-A3B-GGUF \
    Tiel-Coder-35B-A3B-UD-IQ4_XS.gguf --local-dir ~/models/tiel
  printf 'FROM ~/models/tiel/Tiel-Coder-35B-A3B-UD-IQ4_XS.gguf\n' > /tmp/tiel.Modelfile
  ollama create tiel:iq4_xs -f /tmp/tiel.Modelfile   # then set OC_MODEL_CODER="tiel:iq4_xs"
  ```
- Two caps that will not fit and will thrash the machine: `qwen3-coder-next` (52 GB minimum) and
  `glm-5.3-flash` / `qwen3.8-flash-next` / `deepseek-v4.1-flash` (100B+ MoE).

---

## 2. Model selection env vars → `~/.env`

Bare model ids, **no `ollama/` prefix** — the config adds it. Add these to `~/.env` (machine-local, so
each Mac can point at the quants it actually has):

```bash
# ~/.env — OpenCode model selection

# --- works today, with your current pulls ---
export OC_MODEL_CODER="hf.co/unsloth/Qwen2.5-Coder-7B-Instruct-GGUF:latest"
export OC_MODEL_REVIEWER="llama3.2:latest"
export OC_MODEL_THINKER="llama3.2:latest"
export OC_MODEL_SMALL="dagbs/qwen2.5-coder-1.5b-instruct-abliterated:q4_k_m"

# --- replace with these once section 1 has finished ---
# export OC_MODEL_CODER="hf.co/peculiar-ragdoll/Tiel-Coder-35B-A3B-GGUF:UD-IQ4_XS"
# export OC_MODEL_REVIEWER="hf.co/peculiar-ragdoll/Dirk-Qwen3.8-27B-GGUF:UD-Q4_K_M"
# export OC_MODEL_THINKER="$OC_MODEL_REVIEWER"
# export OC_MODEL_SMALL="lfm2.5:8b"        # or "$OC_MODEL_CODER" to avoid a model swap - see below
```

| Var | Consumed by |
|---|---|
| `OC_MODEL_CODER` | root `model` (default) + `agents.code-writer` |
| `OC_MODEL_REVIEWER` | `agents."Code-Reviewer"` |
| `OC_MODEL_THINKER` | `agents.thinker` |
| `OC_MODEL_SMALL` | `small_model` (titles/summaries) |

Two gotchas, both verified against `opencode` v2.1.2:

1. `{env:...}` is substituted only in `opencode.jsonc` — **not** in `agents/*.md` frontmatter. That is why
   the model lines were removed from the three agent files and now live under `agents` in the config.
2. Substitution runs in the **background service** process, with `process.env` of that process. A var
   exported only in your current shell does nothing. There is no default syntax either: an unset var
   becomes `""`, the model ref becomes invalid and is dropped (the agent then silently inherits the
   session model). So after editing `~/.env`:

```bash
opencode service status     # sanity check
opencode service restart    # picks up the new env
opencode debug agents       # each agent must show a resolved model id, e.g. {"providerID":"ollama","model":"..."}
```

### When is `OC_MODEL_SMALL` actually used?

Only by the hidden `title` agent — session titles, nothing else. Confirmed three ways: `small_model` is translated
straight into `agents.title.model` in the binary, the title prompt asks for a single line ≤50 characters with no tools,
and this machine's own log shows `agent=title small=true` exactly once per session (43 calls / 43 sessions) while
`agent=build`, `agent=plan` and `agent=compaction` are all `small=false`. Compaction summarization uses the **session**
model — there is no separate compaction model.

Practical consequence on 32 GB: title generation is a tiny request, but it is a **different GGUF**, so with
`OLLAMA_MAX_LOADED_MODELS=1` it evicts the loaded model and the next message pays a reload of the big one (once per new
session). Two ways out:

- **Simplest:** set `OC_MODEL_SMALL="$OC_MODEL_CODER"`. No swap, no extra GB resident, titles take a second longer.
- Keep a dedicated small model only if you also raise `OLLAMA_MAX_LOADED_MODELS` — but LFM2.5-8B (5.2 GB) + Tiel
  (17.7 GB) = 23 GB is already too tight next to macOS on 32 GB, so this is not recommended here.

---

## 3. Ollama runtime tuning

Ollama runs as a **launchd service** here (`~/Library/LaunchAgents/sh.brew.ollama.plist`), not from your
shell — so `export`s in `zshrc` do not reach it. It already sets flash attention + q8_0 KV cache; add the
memory/concurrency limits and a context size:

```xml
<!-- ~/Library/LaunchAgents/sh.brew.ollama.plist -> EnvironmentVariables -->
<key>EnvironmentVariables</key>
<dict>
    <key>OLLAMA_FLASH_ATTENTION</key>
    <string>1</string>
    <key>OLLAMA_KV_CACHE_TYPE</key>
    <string>q8_0</string>          <!-- halves KV memory; requires FLASH_ATTENTION=1 -->
    <key>OLLAMA_MAX_LOADED_MODELS</key>
    <string>1</string>             <!-- never keep a second model resident on 32 GB -->
    <key>OLLAMA_NUM_PARALLEL</key>
    <string>1</string>             <!-- one request at a time: biggest context per model -->
    <key>OLLAMA_CONTEXT_LENGTH</key>
    <string>32768</string>         <!-- OpenCode sends large prompts; 4096 default is too small -->
    <key>OLLAMA_KEEP_ALIVE</key>
    <string>15m</string>           <!-- avoids a reload between agent runs; 0 unloads immediately -->
</dict>
```

```bash
brew services restart ollama
```

Optional, if you keep hitting the GPU memory ceiling while a big model is loaded:
`sudo sysctl iogpu.wired_limit_mb=24576` (24 GB; not persistent — re-apply after reboot).

---

## 4. Verifying speed on this machine

```bash
ollama ps                      # loaded model, size, context, CPU/GPU split
ollama run <model> --verbose   # prints eval rate (tok/s) after the reply
```

Rough expectations on an M4 / 32 GB: Tiel-IQ4_XS ≈ 20–30 tok/s, Dirk-Q4_K_M ≈ 5–7 tok/s (but far fewer
tokens per answer than stock Qwen3.8), Mellum-Q4_K_M ≈ 35–45 tok/s, LFM2.5-8B ≈ 40+ tok/s. If a model
drops to single digits and `ollama ps` shows a CPU/GPU split, it did not fit — step down one quant
(`UD-Q3_K_XL`, `UD-IQ4_XS`) before touching anything else.
