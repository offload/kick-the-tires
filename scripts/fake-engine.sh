#!/usr/bin/env bash
# Fake infrastructure engine for the custom-engine exercise. Speaks the
# Stategraph custom engine contract: init/plan/diff/apply/outputs.
set -euo pipefail
op="$1"; shift || true
case "$op" in
  init)
    echo "fake-engine: initialized workspace"
    ;;
  plan)
    echo "fake-engine: computed desired state (3 changes)"
    printf 'change-set-v1\n' > "${TERRATEAM_PLAN_FILE:-/tmp/fake.plan}"
    ;;
  diff)
    printf '+ added service.frontend\n~ updated service.api (replicas 2 -> 4)\n- removed service.legacy\n'
    ;;
  apply)
    echo "fake-engine: applying $(cat "${TERRATEAM_PLAN_FILE:-/tmp/fake.plan}" 2>/dev/null || echo unknown)"
    echo "fake-engine: apply complete (3 changed)"
    ;;
  outputs)
    printf '{"frontend_url": "https://frontend.internal.example", "replicas": 4}\n'
    ;;
  *)
    echo "fake-engine: unknown op $op" >&2; exit 1
    ;;
esac
