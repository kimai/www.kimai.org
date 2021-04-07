---
title: "A propos de Kimai"
description: Qu'est-ce qui se cache derrière l'application de suivi du temps Kimai ? Apprenez-en plus sur elle, son histoire et son développeur.
lang: fr
lang-ref: about
permalink: /fr/apropos-kimai.html
---

#  Qu'est-ce que Kimai ?

{% include alert.html icon="far fa-thumbs-up" alert='Peut-être <strong>la meilleure application de suivi du temps, libre et open source</strong>, que vous trouverez ...' %}

![Kimai logo]({% link /images/kimai_logo.png %}){:class="float-right" style="margin-left: 20px" }

Kimai est un logiciel de suivi du temps qui a une longue histoire. La première version a été publiée en 2006.
Pourquoi en parle-t-on ? Parce que nous avons vu de nombreux programmes aller et venir au cours de la dernière décennie - faites-nous confiance quand nous disons :
nous resterons sur le marché. Nous n'avons jamais vécu de Kimai, c'est le plaisir qui nous motive à améliorer Kimai.
Nous pensons que c'est l'une des principales raisons du succès de Kimai.

Nous construisons Kimai dans un seul but : suivre vos heures de travail. Kimai prend en charge un nombre illimité d'utilisateurs et de saisies de feuilles de temps,
afin que vous puissiez gérer toutes vos équipes/services en une seule installation facile à utiliser.
Kimai est basé sur le web, donc tout ce dont vous avez besoin est un serveur web compatible avec PHP. Il est doté d'un design réactif,
pour que vous puissiez même suivre l'heure sur votre appareil mobile lorsque vous êtes en déplacement.
Kimai a été traduit en plusieurs langues et les traductions manquantes peuvent être facilement ajoutées en utilisant le standard de traduction ouvert Xliff.

Oh, et avons-nous mentionné que vous pouvez créer des factures à partir de vos feuilles de temps dans votre navigateur ?
Non seulement Kimai dispose de modèles de factures personnalisables, mais il peut être facilement étendu de plusieurs façons.
Il est construit sur les frameworks les plus populaires et les plus modernes et dispose de nombreuses interfaces pour vos développeurs.

Nous pourrions maintenant écrire beaucoup plus sur ses caractéristiques et les avantages qu'il vous apportera - que vous soyez indépendant,
une petite organisation ou une entreprise de plusieurs centaines d'employés - mais nous pensons plutôt que l'essayer par vous-même vaut bien plus que  mille mots de notre part :
Alors, soyez notre invité et testez Kimai en ligne avec notre [Installation de démo]({% link _pages/fr/demo.md %}).
Si vous préférez les choses concrètes, nous avons compilé [une liste des principales fonctionnalités]({% link _pages/fr/index.html %}).

Et enfin, et ce n'est pas le moins important, probablement même la chose la plus importante :
**Kimai est open source, vous pouvez le télécharger gratuitement et vous ne paierez jamais de frais de licence pour une mise à jour ultérieure.**

## Qui est Kimai?

Il existe une grande communauté autour de Kimai et il est impossible d'énumérer toutes les personnes impliquées.
Vous trouverez ci-dessous une courte liste d'anciens développeurs.
Le [Marketplace]({% link _pages/fr/store.html %}) contient une liste de plugins et de leurs développeurs, cela vous donne une bonne idée des développeurs
qui soutiennent le projet grâce à leurs connaissances.

L'auteur principal derrière Kimai, ce site web, les installations de démonstration et certains plugins est :

{% include card-donate.html user="kevinpapst" %}

Il y a aussi de nombreuses personnes qui contribuent pendant leur temps libre et qui donnent leur avis, fournissent des critiques et posent des questions constructives.
Vous trouverez leurs noms à l'adresse suivante  [GitHub]({{ site.kimai_v2_repo }}/issues).

Mes remerciements les plus sincères à vous tous ❤️   

## L'histoire de Kimai

Kimai a une longue histoire et était bien en avance sur son temps lorsque l'équipe de Torsten Höltge a commencé à le développer en 2006.
Il a été conçu de manière responsive (merci beaucoup à la magie de Javascript) à une époque où ce mot n'était même pas encore officiellement inventé.

Il a voulu l'arrêter pour des [raisons personnelles et par manque de temps]({% link _posts/2009-06-19-bye-bye-folks.md %}), lorsque le projet a été repris par Kevin. Avec l'aide d'autres volontaires du logiciel libre, [Kevin a pu le maintenir]({% link _posts/2009-07-20-the-condemned-live-longer.md %}) en vie et le prolonger pendant plusieurs années.

Pendant ce temps, la communauté PHP faisait de grands progrès, tandis que l'histoire technique de Kimai - construite
sur de nombreux scripts PHP individuels, qui devaient tous être accessibles au public - prenait de plus en plus de retard.
La base de données présentait quelques inconvénients majeurs, tels qu'une extensibilité limitée et une conception problématique.
Après de nombreuses années de développement, le code est devenue de plus en plus difficile à maintenir et la logique s'est répandue de façon incontrôlée dans les scripts, les classes
et la couche frontale.

C'est pourquoi, il y a eu l'idée de réécrire Kimai avec des frameworks modernes pendant très longtemps, également motivée par les demandes de la communauté,
mais nous n'avons pas eu le temps de faire avancer ces idées.
Fin 2017, Symfony 4.0 est sorti en même temps qu'une pile de construction frontale moderne appelée _Webpack-Encore_.
Puis Kevin a saisi l'occasion et a commencé à développer la prochaine étape de l'évolution : Kimai 2 est né.

Le première version de Kimai a plus de 13 ans et est utilisée par des gens du monde entier. Nous en sommes fiers, ainsi que de sa grande communauté.
Nous tenons donc à remercier tous ceux qui ont contribué à Kimai.
Il y avait beaucoup trop de gens pour les nommer tous, alors cette liste n'est qu'une petite compilation des personnes qui ont consacré beaucoup de temps, de code, de réflexion et d'aide à Kimai 1 et à sa communauté :

{% include pages/about_contributors.md %} 
