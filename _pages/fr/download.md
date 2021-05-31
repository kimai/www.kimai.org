---
layout: page
title: Téléchargement
description: Télécharger - Kimai Time Tracking
options: '<a href="https://github.com/kevinpapst/kimai2/releases.atom" class="btn btn-option"><i class="fa fa-rss"></i></a>'
lang: fr
lang-ref: download
permalink: /fr/download.html
---

# Téléchargez Kimai - gratuitement !


### Configuration requise pour le serveur

Ces exigences sont remplies par presque tous les fournisseurs d'hébergement :

- PHP 7.3 ou supérieur
    - Extensions PHP : `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip`
- Base de données (MariaDB ou MySQL)
- [Webserver](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache avec mod_rewrite ...)
- Un sous-domaine libre (l'utilisation en sous-dossier n'est pas supportée)
- Un navigateur moderne (les anciennes versions, en particulier Safari et IE, peuvent être buggées)

## Installation avec SSH

**La méthode recommandée pour installer Kimai !**

Seuls `git` et `composer` sont nécessaires pour l'[Installation]({% link _documentation/installation.md %}), qui sont exécutés directement sur le système cible.
Merci de lire attentivement les [Instructions d'installation]({% link _documentation/installation.md %}), il n'y a aucune raison de télécharger Kimai manuellement.

{% capture docText %}
Vous trouverez un guide d'installation complet dans notre [Documentation]({% link _documentation/installation.md %}) en anglais.
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

## Version de développement

La version de développement est le dernier paquet sur lequel nous travaillons actuellement (également appelé `master`).
Il comprend de nouvelles fonctionnalités et des corrections de bogues (voir [site de démo]({% link _pages/demo.md %})), mais il se peut qu'il ne soit pas aussi stable qu'une version officielle.
Si vous êtes un utilisateur expérimenté de Kimai et que vous disposez des ressources nécessaires pour nous aider à tester ou si vous souhaitez simplement utiliser de toutes nouvelles fonctionnalités, vous pouvez [installer la dernière version de développement]({% link _documentation/installation.md %}#développement-installation).

Aidez-nous, testez Kimai et [informez-nous]({{ site.kimai_v2_repo }}/questions) si vous trouvez des problèmes.

### Plus de téléchargements

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Version {{ site.kimai_v2_version }} (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Version de développement (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Info version {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> Toutes les versions </a>
