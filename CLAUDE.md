# CRUSH

Build/lint/test
- Build/up: make up
- Lint: none configured; prefer docker-compose/Markdown/YAML validation via yamllint and markdownlint if added
- Tests: none configured; if scripts are added, document `npm test`/`pytest` here. For single test, prefer `pytest -k <name>` or `npm test -- <pattern>`

Repo conventions
- Language: infra-focused repo (Docker Compose, SQL, YAML). Keep shell/YAML strict and minimal.
- Formatting: 2 spaces for YAML, LF line endings, UTF-8. Trim trailing whitespace. Final newline required.
- Imports: N/A; for scripts, keep stdlib first, third-party next, local last.
- Types: Prefer bash strict mode (set -Eeuo pipefail) in scripts. Avoid untyped dynamic behavior.
- Naming: kebab-case for files, snake_case for shell vars, UPPER_SNAKE for constants. Services match docker-compose service names.
- Env: Never commit secrets (.env is gitignored). Use environment variables via docker-compose.yaml not hardcoded.
- Errors: Fail fast; exit nonzero on errors. In compose, set restart policies appropriately.
- Logging: Use set -x locally only; avoid printing secrets. Redirect verbose logs to files if needed.
- Dependencies: Do not assume tools beyond Docker and Make. Pin image tags where possible.

Data and artifacts
- App data is under data/ and *-data/ (gitignored). Do not store large binaries in repo.

Cursor/Copilot rules
- Cursor rule present: .cursor/rules/image-to-credit-card-statement-csv.mdc. When given a screenshot of transactions, output CSV with headers date, desc, amount; date dd-mm-yyyy; desc merchant lowercased; amount no commas, minus for debits, plus for credits. Save as data/credit-card-statements/<last4>-<month>-<year>.csv (default year 2025 if absent).

PR/Commits
- Small, atomic commits. No secrets. Describe WHY over WHAT.
