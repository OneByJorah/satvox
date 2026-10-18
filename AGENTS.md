# AGENTS.md — agent notes + memory for this project

## Local Obsidian vault = notes + memory (mandatory)

- **Vault:** `/home/j1admin/Obsidian Vault` (env `$OBSIDIAN_VAULT`). Only vault;
  local to this VM. No other Obsidian instance; no network sync.
- **Start of session:** read `Ai/Memory/MEMORY.md` and `Ai/Memory/<agent>/`.
- **During work:** append notes to `Ai/daily-notes/<agent>/YYYY-MM-DD.md` (UTC).
- **Before finishing:** append durable facts as dated bullets to
  `Ai/Memory/MEMORY.md`.
- **Never write secrets** to the vault — reference file path + line only.
- Quick helper: `~/bin/j1-note daily <agent> "text"` / `~/bin/j1-note memory "text"`.

Full protocol: `/home/j1admin/Obsidian Vault/Ai/Memory/README.md`.

## Working rules
- Keep changes minimal and evidence-based; never fabricate results or screenshots.
- Never push to `main`; branch as `repo-elevation/<repo>` and open a PR.
