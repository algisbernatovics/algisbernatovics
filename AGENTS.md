# AGENTS.md

## Cursor Cloud specific instructions

### What this repository is
This is the GitHub **profile README** repository (`algisbernatovics/algisbernatovics`). It is not an application: there is no package manager, build step, or server. It contains only static content and one utility script:

- `README.md` — the profile page rendered on the GitHub user profile.
- `CV_DEPLOYMENT_GUIDE.md`, `PORTFOLIO_IMPROVEMENTS_SUMMARY.md`, `PORTFOLIO_TODO.md`, `LICENSE` — documentation.
- `add_topics.sh` — the only executable; a Bash script that adds GitHub topics to the owner's 20 repos via `PUT https://api.github.com/repos/<user>/<repo>/topics`.

There are **no dependencies to install** and nothing to compile or serve. The update script is intentionally a no-op.

### Lint
Shell is the only "code". Lint with `shellcheck add_topics.sh` (passes clean). `shellcheck` is a system package (`apt-get install -y shellcheck`); it is not a repo dependency, so it is not in the update script — install it ad hoc if needed.

### Running / testing `add_topics.sh` safely
`add_topics.sh` performs **real, side-effecting** GitHub API writes and requires a valid `GITHUB_TOKEN` plus the `GITHUB_USER` to own the listed repos. Do **not** run it as-is against live GitHub for testing.

To exercise it end-to-end without side effects, put a fake `curl` earlier on `PATH` that echoes the request and returns a stubbed JSON response, then run:

```bash
PATH="$HARNESS:$PATH" GITHUB_TOKEN=mock bash add_topics.sh
```

A successful run prints `✓ Done: <repo>` for all 20 repositories and exits 0.

### Previewing the README
The profile README is plain GitHub-Flavored Markdown; render it with any Markdown previewer (e.g. `grip`) or view on GitHub. There is no local web server.
