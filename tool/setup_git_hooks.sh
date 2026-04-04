#!/usr/bin/env bash

set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

git config --local core.hooksPath .githooks
chmod +x .githooks/pre-commit .githooks/pre-push tool/format_dart.sh tool/setup_git_hooks.sh

echo 'Configured Git hooks to use .githooks'
