# Organizator

Tableau de bord personnel pour suivre des dossiers/projets : où ça bloque,
quelles sont les prochaines deadlines, quand relancer.

Fichier unique `index.html`, aucune dépendance, aucune donnée envoyée nulle
part — tout est stocké dans `localStorage` du navigateur.

## Utilisation

Ouvrir `index.html` dans un navigateur. Aucune étape de build.

- **+ Nouveau projet** : nom (obligatoire), client, statut, deadline,
  prochaine relance, blocage éventuel, notes.
- Les projets sont triés automatiquement par urgence : en retard, puis
  aujourd'hui, puis bloqués, puis le reste.
- Les onglets et les compteurs en haut filtrent la liste (en retard,
  aujourd'hui, cette semaine, bloqués, terminés).
- Sur une fiche ouverte, les boutons **+3j / +1sem / +2sem** enregistrent
  une relance effectuée et programment la suivante en un clic.

## Statut de ce dossier

Ce sous-dossier vit temporairement dans le dépôt AGENCIMMO, le temps de
créer un dépôt GitHub dédié. Il est volontairement autonome (aucun lien
avec le reste du dépôt) pour pouvoir être déplacé tel quel plus tard :
`git mv organizator/* <nouveau-dépôt>/`.
