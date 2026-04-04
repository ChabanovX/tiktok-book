#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: tool/format_dart.sh [--check] [--staged] [--print0]

Formats non-generated Dart files in the repository.

Options:
  --check    Verify formatting without writing changes.
  --staged   Limit formatting to staged files.
  --print0   Print selected files as a NUL-delimited list and exit.
  --help     Show this help message.
EOF
}

mode='write'
source_scope='all'
list_only='false'

is_generated_dart_file() {
  case "$1" in
    *.g.dart|*.freezed.dart|*.gen.dart|*.mocks.dart|*.pb.dart|*.config.dart|*.tailor.dart)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check)
      mode='check'
      ;;
    --staged)
      source_scope='staged'
      ;;
    --print0)
      list_only='true'
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      usage
      exit 1
      ;;
  esac
  shift
done

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

files=()
if [[ "$source_scope" == 'staged' ]]; then
  while IFS= read -r -d '' file; do
    if ! is_generated_dart_file "$file"; then
      files+=("$file")
    fi
  done < <(git diff --cached --name-only --diff-filter=ACMR -z -- '*.dart')
else
  while IFS= read -r -d '' file; do
    files+=("$file")
  done < <(
    find lib test -type f -name '*.dart' \
      ! -name '*.g.dart' \
      ! -name '*.freezed.dart' \
      ! -name '*.gen.dart' \
      ! -name '*.mocks.dart' \
      ! -name '*.pb.dart' \
      ! -name '*.config.dart' \
      ! -name '*.tailor.dart' \
      -print0
  )
fi

if [[ ${#files[@]} -eq 0 ]]; then
  if [[ "$list_only" == 'true' ]]; then
    exit 0
  fi
  echo 'No non-generated Dart files found.'
  exit 0
fi

if [[ "$list_only" == 'true' ]]; then
  printf '%s\0' "${files[@]}"
  exit 0
fi

if [[ "$mode" == 'check' ]]; then
  dart format -o none --set-exit-if-changed "${files[@]}"
else
  dart format "${files[@]}"
fi
