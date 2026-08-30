# AGENCIMMO

Marketplace immobilière entre particuliers : le vendeur dépose son bien,
l'acheteur le contacte directement. La légèreté de Vinted, la confiance de
TripAdvisor — profils vérifiés, avis publics des deux côtés, commission
plafonnée à 990 € au lieu des ~4,5 % d'une agence.

Ce dépôt contient **un prototype de démonstration** : l'application, plus
une page de présentation du projet. Il n'y a ni serveur, ni compte, ni
donnée envoyée nulle part — tout se passe dans le navigateur.

## Les fichiers

Deux sources, écrites sans `<!doctype>` ni `<html>` — c'est le format
attendu par l'outil Artifact, qui fournit lui-même l'enveloppe :

- `app.html` — **l'application**. Plein écran sur téléphone, encadrée comme
  un appareil sur ordinateur. C'est le livrable principal.
- `showcase.html` — la page de présentation : l'app en maquette, puis le
  pitch (problème, parcours vendeur, confiance, modèle, marché).

Et deux fichiers **générés**, à ne jamais modifier à la main :

- `index.html` ← `app.html`
- `pitch.html` ← `showcase.html`

Après toute modification d'une source :

```sh
./build.sh
```

Aucune dépendance, aucune étape de compilation. Les seules ressources
externes sont les polices Google Fonts (Fraunces, Instrument Sans, IBM Plex
Mono). Les visuels de biens sont des élévations d'architecture dessinées en
SVG à la volée : aucune image n'est chargée.

## Ce qui fonctionne vraiment

Le prototype n'est pas une suite de captures :

- **Dépôt d'annonce complet** en trois étapes — photos (vraies, prises
  depuis le téléphone, réduites dans le navigateur) ou illustration
  générée, caractéristiques du bien, prix. L'annonce publiée apparaît
  réellement en tête du fil avec le badge « Votre annonce », et un acheteur
  fictif ouvre une conversation dessus.
- **Estimation automatique** du prix à partir d'un barème €/m² par ville,
  pondéré par le DPE, le type de bien et la surface, avec une jauge qui
  situe le prix saisi dans la fourchette du secteur.
- Validation des champs obligatoires, recherche dans le fil, filtres par
  type, favoris, fiche détaillée, messagerie avec envoi de messages,
  tableau de bord vendeur.
- **Persistance locale** : annonce et favoris survivent à un rechargement
  (`localStorage`, ce navigateur uniquement).

Entre deux démonstrations : **Profil → Réinitialiser la démo**.

## Sur téléphone

Ouvrir l'app, puis « Ajouter à l'écran d'accueil ». Elle s'ouvre alors sans
barre de navigateur, et les encoches comme la barre d'accueil sont prises
en compte (`env(safe-area-inset-*)`).

## Mettre en ligne

Le dépôt est prêt pour GitHub Pages : `index.html` est à la racine de la
branche par défaut, et `.github/workflows/pages.yml` régénère puis publie à
chaque poussée.

Il reste **un réglage à faire à la main, une seule fois** — le jeton d'une
GitHub Action n'a pas le droit de créer un site Pages :

**Settings → Pages → Source → « GitHub Actions »**

L'app sort alors sur `https://thelordmuffin.github.io/AGENCIMMO/`, et la
présentation sur `.../AGENCIMMO/pitch.html`.

## Chiffres

Les montants du pitch (≈ 780 000 ventes par an, ≈ 6 Md€ de commissions, une
vente sur trois déjà de particulier à particulier) sont des ordres de
grandeur destinés à dimensionner l'opportunité. Ils sont à re-sourcer
précisément — notaires de France, INSEE — avant toute présentation à un
investisseur. Les biens, vendeurs, avis et conversations sont fictifs.
