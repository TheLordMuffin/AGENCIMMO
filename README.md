# AGENCIMMO — vitrine du projet

Marketplace immobilière entre particuliers : le vendeur dépose son bien,
l'acheteur le contacte directement. La légèreté de Vinted, la confiance de
TripAdvisor — profils vérifiés, avis publics des deux côtés, commission
plafonnée à 990 € au lieu des ~4,5 % d'une agence.

Ce dépôt contient **une vitrine de démonstration**, faite pour présenter le
projet. Ce n'est pas l'application : il n'y a ni serveur, ni compte, ni
donnée envoyée nulle part.

## Le fichier

`showcase.html` — page unique, sans dépendance ni build. Elle contient à la
fois le prototype cliquable de l'app et le pitch (problème, parcours,
modèle économique, marché, trajectoire).

Les seules ressources externes sont les polices Google Fonts (Fraunces,
Instrument Sans, IBM Plex Mono). Les visuels de biens sont des élévations
d'architecture dessinées en SVG à la volée — aucune image n'est chargée.

## Ce qui fonctionne vraiment

Le prototype n'est pas une suite de captures :

- **Dépôt d'annonce complet** en trois étapes — photos (vraies, depuis le
  téléphone ou l'ordinateur, réduites en local) ou illustration générée,
  caractéristiques du bien, prix. L'annonce publiée apparaît réellement en
  tête du fil avec le badge « Votre annonce ».
- **Estimation automatique** du prix à partir d'un barème €/m² par ville,
  pondéré par le DPE, le type de bien et la surface, avec une jauge qui
  situe le prix saisi dans la fourchette du secteur.
- Validation des champs obligatoires, recherche dans le fil, filtres par
  type, favoris, fiche détaillée, messagerie avec envoi de messages,
  tableau de bord vendeur.
- **Persistance locale** : l'annonce déposée et les favoris survivent à un
  rechargement (`localStorage`, ce navigateur uniquement).

Pour repartir de zéro pendant une démo : vider le stockage du site, ou
exécuter `localStorage.removeItem('agencimmo.demo.v1')` dans la console.

## Les deux fichiers

- `showcase.html` — la source. Écrite sans `<!doctype>` ni `<html>` : c'est
  le format attendu par l'outil Artifact, qui fournit lui-même l'enveloppe.
- `index.html` — **généré**, ne pas modifier à la main. C'est `showcase.html`
  enveloppé dans un document autonome, pour GitHub Pages ou une ouverture
  directe dans un navigateur.

Après toute modification de `showcase.html` :

```sh
./build.sh    # régénère index.html
```

## Mettre la démo en ligne

Le dépôt est prêt pour GitHub Pages : `index.html` est à la racine de la
branche par défaut, aucune configuration de build n'est nécessaire.

Dans **Settings → Pages** : Source « Deploy from a branch », branche
`claude/real-estate-showcase-app-xz5vek`, dossier `/ (root)`. La page sort
sur `https://thelordmuffin.github.io/AGENCIMMO/` après une minute.

GitHub Pages ne dessert pas les dépôts privés sur le plan gratuit : il faut
soit rendre le dépôt public, soit un plan payant. La page de réglages
l'indique au moment de l'activation.

## Chiffres

Les montants du pitch (≈ 780 000 ventes par an, ≈ 6 Md€ de commissions,
une vente sur trois déjà de particulier à particulier) sont des ordres de
grandeur destinés à dimensionner l'opportunité. Ils sont à re-sourcer
précisément — notaires de France, INSEE — avant toute présentation à un
investisseur. Les biens, vendeurs, avis et conversations sont fictifs.
