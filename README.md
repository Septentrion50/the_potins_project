# The Potins Project
Amélioration du projet de base, la base de données est maintenant en **Postgresql**,
et des pages statiques existent pour afficher les views de base.

## Si vous voulez tester

|Action|Commande à rentrer|
|:---|:---|
|Installer les dépendances| `bundle install`|
|Initialiser la base de données| `rails db:create`|
|Opérer les migrations| `rails db:migrate`|
|Remplir la base de données| `rails db:seed`|
|Lancer le serveur| `rails server`|
|Une fois le serveur lancé| [Cliquez Ici](http://localhost:3000/gossip)|

**Astuce :** Pour accéder plus vite aux pages `welcome/<first-name>`, regardez les prénoms des
utilisateurs sur la page d'accueil, et copiez-collez les dans l'url suivant :

```html
localhost:3000/welcome/<collez-ici>
```

Vous pouvez aussi mettre n'importe quel prénom dans la barre d'url.

## Schema de la base de données

[![](https://mermaid.ink/img/eyJjb2RlIjoiZXJEaWFncmFtXG4gICAgICAgICAgQ2l0eSB8fC0tb3sgVXNlcjogaGFzX21hbnlcbiAgICAgICAgICBDaXR5e1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBzdHJpbmcgbmFtZVxuICAgICAgICAgIHN0cmluZyB6aXBfY29kZVxuICAgICAgICAgIH1cbiAgICAgICAgICBVc2Vye1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBpbnRlZ2VyIGNpdHlfaWRfRktcbiAgICAgICAgICBzdHJpbmcgZmlyc3RfbmFtZVxuICAgICAgICAgIHN0cmluZyBsYXN0X25hbWVcbiAgICAgICAgICB0ZXh0IGRlc2NyaXB0aW9uXG4gICAgICAgICAgc3RyaW5nIGVtYWlsXG4gICAgICAgICAgaW50ZWdlciBhZ2VcbiAgICAgICAgICBzdHJpbmcgcGFzc3dvcmRfZGlnZXN0XG4gICAgICAgICAgfVxuICAgICAgICAgIFVzZXIgfHwtLW97IEdvc3NpcDogaGFzX21hbnlcbiAgICAgICAgICBHb3NzaXB7XG4gICAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICAgIHN0cmluZyB0aXRsZVxuICAgICAgICAgIHRleHQgY29udGVudFxuICAgICAgICAgIH1cbiAgICAgICAgICBVc2VyIHx8LS1veyBDb21tZW50OiBoYXNfbWFueVxuICAgICAgICAgIEdvc3NpcCB8fC0tb3sgQ29tbWVudDogcG9seW1vcnBoaWNcbiAgICAgICAgICBDb21tZW50e1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBpbnRlZ2VyIHVzZXJfaWRfRktcbiAgICAgICAgICBpbnRlZ2VyIGNvbW1lbnRfdGFyZ2V0X2lkX0ZLXG4gICAgICAgICAgc3RyaW5nIGNvbW1lbnRfdGFyZ2V0X3R5cGVcbiAgICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgICB9XG4gICAgICAgICAgQ29tbWVudCB8fC0tb3sgQ29tbWVudDogcG9seW1vcnBoaWNcbiAgICAgICAgICBHb3NzaXAgfHwtLW97IExpa2U6IHBvbHltb3JwaGljXG4gICAgICAgICAgQ29tbWVudCB8fC0tb3sgTGlrZTogcG9seW1vcnBoaWNcbiAgICAgICAgICBVc2VyIHx8LS1veyBMaWtlOiBoYXNfbWFueVxuICAgICAgICAgIExpa2V7XG4gICAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICAgIGludGVnZXIgbGlrZV90YXJnZXRfaWRcbiAgICAgICAgICBzdHJpbmcgbGlrZV90YXJnZXRfdHlwZVxuICAgICAgICAgIH1cbiAgICAgICAgICAgICIsIm1lcm1haWQiOnt9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZXJEaWFncmFtXG4gICAgICAgICAgQ2l0eSB8fC0tb3sgVXNlcjogaGFzX21hbnlcbiAgICAgICAgICBDaXR5e1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBzdHJpbmcgbmFtZVxuICAgICAgICAgIHN0cmluZyB6aXBfY29kZVxuICAgICAgICAgIH1cbiAgICAgICAgICBVc2Vye1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBpbnRlZ2VyIGNpdHlfaWRfRktcbiAgICAgICAgICBzdHJpbmcgZmlyc3RfbmFtZVxuICAgICAgICAgIHN0cmluZyBsYXN0X25hbWVcbiAgICAgICAgICB0ZXh0IGRlc2NyaXB0aW9uXG4gICAgICAgICAgc3RyaW5nIGVtYWlsXG4gICAgICAgICAgaW50ZWdlciBhZ2VcbiAgICAgICAgICBzdHJpbmcgcGFzc3dvcmRfZGlnZXN0XG4gICAgICAgICAgfVxuICAgICAgICAgIFVzZXIgfHwtLW97IEdvc3NpcDogaGFzX21hbnlcbiAgICAgICAgICBHb3NzaXB7XG4gICAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICAgIHN0cmluZyB0aXRsZVxuICAgICAgICAgIHRleHQgY29udGVudFxuICAgICAgICAgIH1cbiAgICAgICAgICBVc2VyIHx8LS1veyBDb21tZW50OiBoYXNfbWFueVxuICAgICAgICAgIEdvc3NpcCB8fC0tb3sgQ29tbWVudDogcG9seW1vcnBoaWNcbiAgICAgICAgICBDb21tZW50e1xuICAgICAgICAgIGludGVnZXIgaWRfUEtcbiAgICAgICAgICBpbnRlZ2VyIHVzZXJfaWRfRktcbiAgICAgICAgICBpbnRlZ2VyIGNvbW1lbnRfdGFyZ2V0X2lkX0ZLXG4gICAgICAgICAgc3RyaW5nIGNvbW1lbnRfdGFyZ2V0X3R5cGVcbiAgICAgICAgICB0ZXh0IGNvbnRlbnRcbiAgICAgICAgICB9XG4gICAgICAgICAgQ29tbWVudCB8fC0tb3sgQ29tbWVudDogcG9seW1vcnBoaWNcbiAgICAgICAgICBHb3NzaXAgfHwtLW97IExpa2U6IHBvbHltb3JwaGljXG4gICAgICAgICAgQ29tbWVudCB8fC0tb3sgTGlrZTogcG9seW1vcnBoaWNcbiAgICAgICAgICBVc2VyIHx8LS1veyBMaWtlOiBoYXNfbWFueVxuICAgICAgICAgIExpa2V7XG4gICAgICAgICAgaW50ZWdlciBpZF9QS1xuICAgICAgICAgIGludGVnZXIgdXNlcl9pZF9GS1xuICAgICAgICAgIGludGVnZXIgbGlrZV90YXJnZXRfaWRcbiAgICAgICAgICBzdHJpbmcgbGlrZV90YXJnZXRfdHlwZVxuICAgICAgICAgIH1cbiAgICAgICAgICAgICIsIm1lcm1haWQiOnt9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)

## Liens de documentation

* Les [Scaffolds](https://www.rubyguides.com/2020/03/rails-scaffolding/)
* Les slides sur les [link_to et autres button_to](https://slides.com/jocelinqueau/deck)
* La [retransmission du live](https://www.youtube.com/watch?v=5C0klyrJq4Y)

N'hésitez surtout pas à faire un fork de ce repository si vous voulez compléter les choses qui n'ont pas été faites,
comme la relation N-N entre les tags et les gossips, ou encore l'implémentation dans les views et dans le controller
des commentaires de commentaires !

## Changelog

### 21-05-2021 - V.0.5

* Modification du README pour ajouter de la documentation et le lien vers le live d'explication du projet.
* Modification du Schéma de la base de données pour rajouter la relation `has_many` manquante entre `likes` et `users`.

### 13-05-2021 - V.0.4

* Mise en place des sessions utilisateurs, vous pouvez vous connecter ou créer un compte.
* Pour effectuer une action autre que lire la page d'accueil, être connecté est obligatoire.
* Vous pouvez modifier ou supprimer vos potins.
* Il est maintenant possible de liker des gossips.
* Si l'auteur du gossip que vous avez liké est un malotru, vous pouvez aussi le déliker.
* Vous pouvez également commenter les gossips.
* Vous pouvez aussi modifier ou supprimer vos commentaires.

### 11-05-2021 - V.0.3

* Changement des routes manuelles vers des expressions `resources`.
* Changement de domiciliation de la page d'accueil de `localhost:3000` vers `localhost:3000/gossip`.
* Correction du bug de la page `welcome/<first_name>`.
Elle peut maintenant afficher n'importe quel prénom passé en url.
* La gem `Turbolinks` a été retirée, elle générait des bugs.
* Mise en place de la possibilité de créer un gossip. 
