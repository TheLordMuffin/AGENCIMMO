#!/bin/sh
# Enveloppe showcase.html dans un document HTML autonome, consultable
# hors de l'outil Artifact (qui fournit lui-même cette enveloppe).
set -eu
mkdir -p dist
{
  printf '%s' '<!doctype html><html lang="fr"><head><meta charset="utf-8">'
  printf '%s' '<meta name="viewport" content="width=device-width,initial-scale=1">'
  printf '%s' '<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  printf '%s' '</head><body>'
  cat showcase.html
  printf '%s' '</body></html>'
} > dist/index.html
echo "dist/index.html écrit"
