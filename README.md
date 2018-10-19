# Premier projet de groupe, tranquille

Projet d'équipe / Team project


Réalisé dans le cadre de la communauté THP session 6.
Ce projet a pour but de mettre en lien et en pratique
ce que nous avons appris sur ruby.

## Projet
Ce que fait ce programme : 
- Récupère les données des mairies des Bouches-du-Rhône, La Haute-Corse<br/>et le Territoire de Belfort( Nom, Mail ) et les mets dans un CSV
- Envoie un mail promotionnel à chacune des mairies
- Recupère les comptes Twitter grace au CSV puis crée des handles Twitter<br/> et les rajoute ensuite au CSV
ils seront ensuite utilisé par un bot Twitter pour les follows.

## Plan 
```
THP-Day13
├── .gitignore
├── .env (**Il faudra rajouter le votre pour que ceci marche**)
├── README.md
├── Gemfile
├── Gemfile.lock
├── app.rb
├── db
│   └── townhalls.csv
└── lib
    ├── app
    │   ├── townhalls_scrapper.rb
    │   ├── townhalls_mailer.rb
    │   ├── townhalls_adder_to_db.rb
    │   └── townhalls_follower.rb
    └── views
        ├── done.rb
        └── index.rb
```
## Prérequis

Nous utilisons ici ruby 2.5.1
avec les gems suivante :
- rubocop ~> 0.57.2
- gem pry
- gem mail
- gem dotenv
- gem twitter

Il vous suffira donc de taper :


```
$ bundle install

```
## Lancement
Très simple ! Tapez ceci dans la racine :
## **(Ne fonctionne pas, lancez tous les programmes 1 par 1 dans le dossier lib/app)**
```
$ ruby app.rb
```

#### Contributions
Ont participé à ce projet : 
- [Nitram](https://github.com/mrtintin13130)
- [Timmo404](https://github.com/timmo404)
- [Winston777](https://github.com/winston777)
- [Jango974](https://github.com/jango974)
- [nomoon456](https://github.com/nomoon456)
