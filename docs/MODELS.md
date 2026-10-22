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

> Sections 1–4 target the **M4 / 32 GB** machine. For the 2019 Intel MacBook Pro, use section 5 instead:
> the models above do not fit and would swap.

---

## 5. MacBook Pro 13" 2019 (Intel i5-8279U, 16 GB) — A1989, this machine

**Model identifier** `MacBookPro15,2` · **macOS** 15.8.1 Sequoia (last Intel release)

| | |
|---|---|
| CPU | Intel Core i5-8279U — 4 cores / 8 threads, 2.4 GHz base / 4.1 GHz turbo, 6 MB L3, 128 MB eDRAM, 28 W, AVX2 (no AVX-512) |
| GPU | Intel Iris Plus Graphics 655, 1536 MB shared — **not usable for LLMs** (Ollama has no Metal backend for Intel iGPUs) |
| RAM | 16 GB LPDDR3-2133, dual channel → **~34 GB/s theoretical, ~20 GB/s effective** |
| Disk | 466 GB SSD, ~280 GB free |

This changes every assumption from section 1:

- **Every token is generated on 4 CPU cores.** `ollama ps` will show `100% CPU`; there is no GPU path to enable,
  no `sysctl iogpu.wired_limit_mb` (Apple Silicon only), and MLX/flash-attention-GPU advice does not apply.
- **Decode speed ≈ 20 GB/s ÷ weights size.** Dense 4B-Q4 ≈ 8 tok/s, dense 9B-Q4 ≈ 3–4 tok/s, a 27B ≈ 1 tok/s.
  This is why nothing bigger than ~6 GB of weights is on the list.
- **Prefill, not decode, is the real pain.** OpenCode's system prompt + tool schemas is ~8–12K tokens. On this CPU
  that is roughly 1–3 minutes before the first output token on a cold context. Ollama caches the KV prefix, so
  follow-up turns in the same session are fast — but starting a fresh session is slow. Keep sessions long, use
  `/compact` rather than new sessions, and don't expect the M4 numbers anywhere.
- **Memory budget.** macOS + apps use ~4–5 GB. Stay ≤ 6–7 GB of weights, one model resident at a time
  (`OLLAMA_MAX_LOADED_MODELS=1`), and close Chrome/Electron apps before a big review.
- Sustained inference on a 28 W 13" will thermally throttle after a few minutes (2.4–2.8 GHz all-core). Expect
  benchmarks taken in the first 30 seconds to be optimistic.

### 5.1 Models — pull these

Minimum install is 8.6 GB (coder + reviewer); 10.8 GB with the small model, 16 GB if you take all four. All are
public on Hugging Face; the Ollama-library names are given where they exist because tag resolution is more
reliable than `hf.co/...`.

| Model | Size | Role | Why |
|---|---|---|---|
| `qwen3.5:4b-q4_K_M` ([Qwen3.5-4B](https://huggingface.co/Qwen/Qwen3.5-4B)) | 2.8 GB | `OC_MODEL_CODER` | best code quality per second that still feels interactive on 4 cores (~7–9 tok/s). Hybrid Gated-Delta attention keeps the 32K KV cache small, native tool calling, 256K max context |
| `hf.co/ornith-ai/Ornith-1.5-9B-GGUF:Q4_K_M` ([Ornith-1.5-9B](https://huggingface.co/ornith-ai/Ornith-1.5-9B)) | 5.8 GB | `OC_MODEL_REVIEWER`, `OC_MODEL_THINKER` | best 9B-class agentic coder available: Terminal-Bench 2.1 **46.2** vs 21.3 for Qwen3.5-9B. Dense 9B → only ~3–4 tok/s, but reviews are one-shot and latency-tolerant, so you pay it once per review instead of once per edit |
| `granite4.2:3b-q4_K_M` ([Granite-4.2-3B](https://huggingface.co/ibm-granite/granite-4.2-3b)) | 2.2 GB | optional `OC_MODEL_SMALL` | fast tool-calling model (~9–11 tok/s) for titles/summaries if you raise `OLLAMA_MAX_LOADED_MODELS=2` |
| `lfm2.5:8b-a1b-q4_K_M` ([LFM2.5-8B-A1B](https://huggingface.co/LiquidAI/LFM2.5-8B-A1B)) | 5.2 GB | optional alternative `OC_MODEL_CODER` | 8.3B total / **1.5B active**, so it is the fastest real option here (~12–15 tok/s) and built for tool loops — but Liquid themselves say it is not the best fit for heavy programming. Swap to it on days when you want agent speed over code quality |

```bash
# coder — 2.8 GB (best default for this machine)
ollama pull qwen3.5:4b-q4_K_M

# reviewer + thinker — 5.8 GB (Hugging Face; :Q4_K_M resolves to Ornith-1.5-9B-Q4_K_M.gguf)
ollama pull hf.co/ornith-ai/Ornith-1.5-9B-GGUF:Q4_K_M

# optional small/fast model — 2.2 GB
ollama pull granite4.2:3b-q4_K_M

# optional faster coder for tool-heavy sessions — 5.2 GB
ollama pull lfm2.5:8b-a1b-q4_K_M
```

If the `hf.co/...:Q4_K_M` tag does not resolve (Ollama's HF tag matching is finicky), build it from the file:

```bash
hf download ornith-ai/Ornith-1.5-9B-GGUF \
  Ornith-1.5-9B-Q4_K_M.gguf --local-dir ~/models/ornith
printf 'FROM %s/models/ornith/Ornith-1.5-9B-Q4_K_M.gguf\nPARAMETER num_ctx 32768\nPARAMETER num_thread 4\n' \
  "$HOME" > /tmp/ornith.Modelfile
ollama create ornith-9b:q4km -f /tmp/ornith.Modelfile   # then set OC_MODEL_REVIEWER="ornith-9b:q4km"
```

**Do not pull on this machine:** Tiel-Coder-35B (17.7 GB), Dirk/Qwen3.8-27B (16.5 GB), `lfm2.5:24b` (14 GB),
`gemma4:12b` (7 GB but ~2 tok/s), `mellum2-12B` (8 GB — fits only with everything else closed, and Ornith beats
it), anything 27B+. They either exceed the 16 GB budget, swap to SSD (1 tok/s or worse), or both.

### 5.2 Env vars

Two separate places — don't mix them up:

**A. `~/.env` — which model OpenCode asks for** (machine-local, already sourced by `zshrc`):

```bash
# --- this MacBook Pro (2019, 16 GB) ---
export OC_MODEL_CODER="qwen3.5:4b-q4_K_M"
export OC_MODEL_REVIEWER="hf.co/ornith-ai/Ornith-1.5-9B-GGUF:Q4_K_M"
export OC_MODEL_THINKER="$OC_MODEL_REVIEWER"
export OC_MODEL_SMALL="$OC_MODEL_CODER"   # avoid a 5 GB reload just to title a session

# swap in the faster MoE coder when you favour throughput over code quality:
# export OC_MODEL_CODER="lfm2.5:8b-a1b-q4_K_M"
```

**B. Ollama server runtime.** Ollama here is **not** a Homebrew agent — it is the MacPorts daemon running as user
`ollama` from `/Library/LaunchDaemons/org.macports.ollama.plist`. It reads `/opt/local/etc/ollama/ollama_env.conf`
(via `/opt/local/libexec/ollama/ollama-wrapper.sh`), **not** your shell, so exports in `zshrc`/`~/.env` never reach
it. Models live in `/opt/local/var/ollama/models`.

The `OLLAMA_CONTEXT_LENGTH=8192` currently sitting in `~/.env` is only a client-side leftover — the daemon ignores
it. Move/duplicate the `OLLAMA_*` settings into the file below (or delete them from `~/.env` to avoid confusion).

```bash
sudo nano /opt/local/etc/ollama/ollama_env.conf
```

```bash
# --- /opt/local/etc/ollama/ollama_env.conf ---
HOME=/opt/local/var/ollama
OLLAMA_MODELS=/opt/local/var/ollama/models

OLLAMA_FLASH_ATTENTION=1      # supported on the CPU backend too
OLLAMA_KV_CACHE_TYPE=q8_0     # halves KV memory; requires FLASH_ATTENTION=1
OLLAMA_MAX_LOADED_MODELS=1    # one model resident on 16 GB
OLLAMA_NUM_PARALLEL=1         # one request at a time -> biggest usable context
OLLAMA_CONTEXT_LENGTH=32768   # matches opencode.jsonc's coder limit
OLLAMA_KEEP_ALIVE=30m         # keeps the KV prefix cache warm between agent runs
```

Two consequences worth knowing:

1. `OLLAMA_CONTEXT_LENGTH` is the **real** ceiling. `opencode.jsonc` advertises 65536 for `OC_MODEL_REVIEWER`;
   with a 32K runtime that is a lie, and OpenCode will not compact before overflowing. Either set it to `32768` in
   `opencode/opencode.jsonc` on this machine, or raise the runtime to `65536` and accept ~2–3 GB of extra KV.
2. Threads: Ollama defaults to the logical CPU count (8) on this box. This is a 4C/8T chip and SMT usually *hurts*
   llama.cpp. If generation feels slower than the numbers above, pin 4 threads on the models you use:

   ```bash
   printf 'FROM qwen3.5:4b-q4_K_M\nPARAMETER num_thread 4\nPARAMETER num_ctx 32768\n' > /tmp/coder.Modelfile
   ollama create coder-4b-t4 -f /tmp/coder.Modelfile

   printf 'FROM hf.co/ornith-ai/Ornith-1.5-9B-GGUF:Q4_K_M\nPARAMETER num_thread 4\nPARAMETER num_ctx 32768\n' > /tmp/reviewer.Modelfile
   ollama create ornith-9b-t4 -f /tmp/reviewer.Modelfile
   # then set OC_MODEL_CODER="coder-4b-t4" and OC_MODEL_REVIEWER="ornith-9b-t4"
   ```

### 5.3 Apply and verify

```bash
# restart the MacPorts daemon so it re-reads /opt/local/etc/ollama/ollama_env.conf
sudo port unload ollama && sudo port load ollama

# restart OpenCode's background service so it re-reads ~/.env
opencode service restart
opencode debug agents      # each agent must show a resolved ollama model id
```

```bash
ollama ps                                  # must say 100% CPU
ollama run qwen3.5:4b-q4_K_M --verbose "Write a Lua function that reverses a table."
```

Expect roughly: **Qwen3.5-4B ≈ 7–9 tok/s**, **Ornith-9B ≈ 3–4 tok/s**, **Granite-4.2-3B ≈ 9–11 tok/s**,
**LFM2.5-8B-A1B ≈ 12–15 tok/s** decode. If a dense 4B drops below ~4 tok/s, check `ollama ps` for a CPU/GPU
split (should not happen — there is no GPU) or memory pressure in Activity Monitor; if the 9B swaps, close apps
rather than lowering the quant (Q3 on a 9B costs more quality than it buys in speed).
