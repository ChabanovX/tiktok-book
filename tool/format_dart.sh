#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: tool/format_dart.sh [--check]

Formats non-generated Dart files in the repository.

Options:
  --check    Verify formatting without writing changes.
  --help     Show this help message.
EOF
}

mode='write'

case "${1:-}" in
  '')
    ;;
  --check)
    mode='check'
    shift
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

if [[ $# -gt 0 ]]; then
  usage
  exit 1
fi

files=()
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

if [[ ${#files[@]} -eq 0 ]]; then
  echo 'No non-generated Dart files found.'
  exit 0
fi

if [[ "$mode" == 'check' ]]; then
  dart format -o none --set-exit-if-changed "${files[@]}"
else
  dart format "${files[@]}"
fi
