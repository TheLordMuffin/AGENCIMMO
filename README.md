# AGENCIMMO

Marketplace immobilière entre particuliers : le vendeur dépose son bien,
l'acheteur le contacte directement. La légèreté de Vinted, une commission
plafonnée à 990 € au lieu des ~4,5 % d'une agence, et un modèle de confiance
fondé sur des faits vérifiés plutôt que sur des notes.

Ce dépôt contient **un prototype de démonstration** : l'application, plus
une page de présentation du projet. Il n'y a ni serveur, ni compte, ni
donnée envoyée nulle part — tout se passe dans le navigateur.

## Les fichiers

Deux sources, écrites sans `<!doctype>` ni `<html>` — c'est le format
attendu par l'outil Artifact, qui fournit lui-même l'enveloppe :

- `showcase.html` — **la source unique**. Elle contient le moteur de l'app
  (illustrations, données, vues, assistant de dépôt, contrôleur) et le pitch
  qui l'entoure.
- `app.html` — **l'application seule**, plein écran. **Générée** par
  `tools/make-app.py`, qui extrait le moteur de `showcase.html` et l'habille
  du châssis rangé dans `tools/`. Ne pas l'éditer à la main : toute
  modification du moteur se fait dans `showcase.html`, sans quoi les deux
  fichiers divergent.

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

## Note de conception : pourquoi aucune note sur les vendeurs

La première version notait les vendeurs par étoiles, façon TripAdvisor. C'est
une erreur, et elle a été retirée.

Un bien se vend à un seul acheteur. Sur vingt visiteurs, dix-neuf repartent
sans rien. Noter le vendeur revient à le sanctionner pour le seul choix qu'il
pouvait faire — et ouvre la porte aux représailles d'une offre refusée, voire
au chantage à l'étoile pendant la négociation. Le déséquilibre aggrave le
tout : un hôte reçoit deux cents voyageurs et un mauvais avis se dilue ; un
vendeur vend une fois, un seul avis vengeur le suit définitivement.

Ce qui est publié à la place :

- **des faits contrôlés avant publication** — identité, titre de propriété,
  diagnostics, surface certifiée, documents de copropriété ;
- **des comportements mesurés par la plateforme** — délai et taux de réponse,
  visites honorées, historique de prix. Des horodatages, pas des opinions ;
- **une seule question fermée**, posée après une visite réellement effectuée :
  le bien correspondait-il à l'annonce ? Publiée en agrégé seulement, à partir
  de trois réponses. On évalue l'exactitude de l'annonce, jamais la personne.

À vérifier avant toute mise en production : la publication d'avis en ligne est
encadrée en France (obligation de transparence sur la vérification et la
modération), et tout contenu rédigé par un utilisateur expose à un risque
diffamatoire. Des badges factuels et des mesures automatiques évitent
largement ce terrain.

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
