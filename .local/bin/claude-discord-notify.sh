#!/usr/bin/env bash

WEBHOOK="https://discord.com/api/webhooks/1531119171427897355/vNQrZYQgHhv8giFPtqXJK7zk4SPDS-_tfDN2YbaCoa3AMNwIJ2IGAapShTF7DC_qoi2v"

curl -s -H "Content-Type: application/json" \
  -d "{\"content\":\"$1\"}" \
  "$WEBHOOK"
