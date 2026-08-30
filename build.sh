#!/bin/sh
# Produit les fichiers publiables à partir des sources.
#
#   showcase.html  source unique : le moteur de l'app + le pitch
#        └─ tools/make-app.py ─→ app.html   (l'app seule, dans son châssis)
#
#   app.html      ─→ index.html   servi à la racine par GitHub Pages
#   showcase.html ─→ pitch.html   la présentation du projet
#
# app.html et showcase.html sont écrits sans <!doctype> ni <html> : c'est le
# format attendu par l'outil Artifact, qui fournit lui-même l'enveloppe.
# GitHub Pages sert les fichiers tels quels et réclame un document complet.
set -eu

python3 tools/make-app.py

envelopper() {
  source_html=$1; sortie=$2; titre=$3
  {
    printf '%s' '<!doctype html><html lang="fr"><head><meta charset="utf-8">'
    printf '%s' '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
    printf '%s' "<meta name=\"description\" content=\"$titre\">"
    printf '%s' '<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
    printf '%s' '</head><body>'
    cat "$source_html"
    printf '%s' '</body></html>'
  } > "$sortie"
  echo "$sortie généré ($(wc -c < "$sortie") octets)"
}

envelopper app.html      index.html "AGENCIMMO — vendez votre bien sans commission d'agence."
envelopper showcase.html pitch.html "AGENCIMMO — le projet : marketplace immobiliere entre particuliers."
