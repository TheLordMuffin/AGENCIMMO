#!/bin/sh
# Enveloppe les sources dans des documents HTML autonomes.
#
# app.html et showcase.html sont écrits sans <!doctype> ni <html> : c'est le
# format attendu par l'outil Artifact, qui fournit lui-même l'enveloppe.
# GitHub Pages, lui, sert les fichiers tels quels — il lui faut un document
# complet.
#
#   index.html  ← l'application
#   pitch.html  ← la page de présentation du projet
set -eu

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
