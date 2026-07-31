#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-cnmbdb/AgentOS}"
VISIBILITY="${2:-private}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI 未安装：https://cli.github.com/"
  exit 1
fi

gh auth status

if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "仓库 $REPO 已存在。"
else
  gh repo create "$REPO" --"$VISIBILITY" --description "AI Agent business automation platform"
fi

git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/${REPO}.git"
git push -u origin main
