---
title: Démo
description: Testez notre système de suivi du temps Kimai, directement en ligne dans l'une de nos installations de démonstration.
lang: fr
lang-ref: demo
permalink: /fr/demo.html
redirect_from:
  - /en/demo.html
  - /demo.html
---
{% assign masterDescription = "Découvrez les dernières fonctionnalités ajoutées dans la version de développement qui sera incluse dans la prochaine version." %}
{% assign stableDescription = "Présentation de la version stable actuelle. Le mieux pour ceux qui ne veulent pas prendre le risque d'avoir des bogues de développement. Version installée : "|append:site.kimai_v2_version %}
{% assign pluginsDescription = "La dernière version de développement avec des extensions supplémentaires installées. Vous pouvez trouver ces extensions sur notre marché." %}

# Testez Kimai dans une de nos démos

{% include alert.html icon="fas fa-desktop" alert='Essayez la démo de suivi du temps de Kimai et nous vous le promettons : Votre prochaine étape sera de le télécharger !' %}

Choisissez l'une de nos installations de démonstration de Kimai 2, où vous pourrez avoir une première impression sur ce logiciel et les fonctionnalités qu'il offre.

<div class="row row-cards">
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Plugins" description=pluginsDescription url="https://demo-plugins.kimai.org" %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Version de développement" description=masterDescription url=site.kimai_v2_demo %}
    </div>
    <div class="col-sm-6 col-lg-4">
        {% include card-demo.html title="Version stable" description=stableDescription url="https://demo-stable.kimai.org" %}
    </div>
</div>

Notez que les démos sont réinstallées périodiquement et que toutes les données saisies sont supprimées.
Mais pour votre commodité, ils sont préremplis de données aléatoires afin que vous puissiez commencer à tester les fonctionnalités (comme la facture ou l'exportation) immédiatement.

Si vous remarquez un problème, je vous demande de laisser un message [bei GitHub]({{ site.kimai_v2_repo }}/issues).

## Utilisateurs de la démo

Ces comptes sont disponibles pour vos tests. Vous pouvez également créer votre propre utilisateur test dans le formulaire d'inscription de chaque démo :

| Nom d'utilisateur | Mot de passe | API |
|---|:---:|:---:|
| **john_user** (Benutzer) | **kitten** | api_kitten |
| **tony_teamlead** (Teamleiter) | **kitten** | api_kitten |
| **anna_admin** (Admin) | **kitten** | api_kitten |
| **susan_super** (Super-Admin) | **kitten** | api_kitten |
| **admin** (Super-Admin) | **password** | - |
