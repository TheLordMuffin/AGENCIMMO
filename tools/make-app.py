#!/usr/bin/env python3
"""Assemble app.html à partir de showcase.html.

showcase.html est la source unique du moteur — illustrations, données, vues,
assistant de dépôt, contrôleur. app.html n'apporte que son propre châssis :
métadonnées d'installation, jetons de couleur, plein écran, adaptation au
format réel d'un téléphone.

Sans ce script, toute correction devrait être portée dans les deux fichiers,
et ils divergeraient.
"""
import pathlib, re, sys

RACINE = pathlib.Path(__file__).resolve().parent.parent
source = (RACINE / "showcase.html").read_text(encoding="utf-8")

def extraire(depuis, jusqua, quoi):
    i = source.find(depuis)
    j = source.find(jusqua, i + 1)
    if i < 0 or j < 0:
        sys.exit(f"make-app: repère introuvable pour {quoi} — showcase.html a changé de structure")
    return source[i:j]

css = extraire("/* corps scrollable de l'écran */",
               "/* ============================ SECTION PRODUIT", "le CSS de l'app")
js  = extraire('"use strict";',
               "/* ---------- synchronisation avec la liste de fonctionnalités",
               "le moteur JavaScript")

# syncFeatures ne pilote que la vitrine ; il n'a pas d'équivalent dans l'app.
js = js.replace("  renderTabs();\n  syncFeatures();\n", "  renderTabs();\n")

for interdit in ("syncFeatures", "featureList", "heroCollage"):
    if interdit in js:
        sys.exit(f"make-app: {interdit} appartient à la vitrine et ne doit pas passer dans l'app")
for requis in (".card{", ".tabbar{", ".toast{", ".trust{"):
    if requis not in css:
        sys.exit(f"make-app: règle {requis} absente du CSS extrait")

lire = lambda nom: (RACINE / "tools" / nom).read_text(encoding="utf-8")
sortie = lire("app-head.html") + css + lire("app-body.html") + js + lire("app-tail.js")

balises = {b: sortie.count(b) for b in ("<style>", "</style>", "<script>", "</script>")}
if set(balises.values()) != {1}:
    sys.exit(f"make-app: balises déséquilibrées {balises}")

(RACINE / "app.html").write_text(sortie, encoding="utf-8")
print(f"app.html assemblé depuis showcase.html ({len(sortie)} octets)")
