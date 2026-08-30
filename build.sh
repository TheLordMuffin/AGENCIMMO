#!/bin/sh
# Génère index.html : showcase.html enveloppé dans un document HTML complet.
# showcase.html est écrit sans <!doctype> ni <html> — c'est le format attendu
# par l'outil Artifact, qui fournit lui-même l'enveloppe. GitHub Pages, lui,
# sert le fichier tel quel : il lui faut un document autonome.
set -eu
{
  printf '%s' '<!doctype html><html lang="fr"><head><meta charset="utf-8">'
  printf '%s' '<meta name="viewport" content="width=device-width,initial-scale=1">'
  printf '%s' '<meta name="description" content="AGENCIMMO — marketplace immobiliere entre particuliers. Prototype et presentation du projet.">'
  printf '%s' '<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  printf '%s' '</head><body>'
  cat showcase.html
  printf '%s' '</body></html>'
} > index.html
echo "index.html généré ($(wc -c < index.html) octets)"
