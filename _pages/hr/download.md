---
layout: page
title: Preuzimanje
description: Preuzimanje – Kimai program za evidentiranje vremena
options: '<a href="https://github.com/kevinpapst/kimai2/releases.atom" class="btn btn-option"><i class="fa fa-rss"></i></a>'
lang: hr
lang-ref: download
permalink: /hr/download.html
---

# Preuzmi Kimai – besplatno!

<div class="row">
<div class="col-sm-12 col-lg-8" markdown="1">

### Uvjeti za poslužitelja

Ove uvjete pružaju gotovo sve hosting tvrtke:

- PHP 7.3 ili novija verzija
- PHP proširenja: `mbstring`, `gd`, `intl`, `pdo`, `xml`, `zip`, `xsl`
- Baza podataka: MariaDB ili MySQL
- [Web-poslužitelj](https://www.kimai.org/documentation/webserver-configuration.html) (nginx, Apache s mod_rewrite)
- Besplatna poddomena (upotreba u poddirektoriju nije podržana)
- Moderni preglednik

## Instalacija sa SSH

Preporučeni način [instaliranja programa Kimai]({% link _documentation/installation.md %}): koristi `git` i `composer` izravno na ciljanom sustavu.

{% capture docText %}
Potpune instrukcije za instaliranje nalaze se u našoj [dokumentaciji]({% link _documentation/installation.md %}).
{% endcapture %}

{% assign docText = docText|markdownify %}
{% include alert.html type="success" icon="fas fa-book" alert=docText %}

## Razvojna verzija

Razvojna verzija je najnoviji paket na kojem trenutačno radimo, koji se također zove `master`.
Uključuje nove značajke i ispravke grešaka (pogledaj [demo stranicu]({% link _pages/demo.md %})). Program možda neće biti stabilan kao službeno izdanje.
Iskusni Kimai korisnici nam mogu pomoći u testiranju, [instaliranjem razvojne verzije]({% link _documentation/installation.md %}#development-installation)
i [slanjem povratnih informacija]({{ site.kimai_v2_repo }}/issues) ako naiđu na probleme.

### Poveznice za preuzimanje

<a href="{{ site.kimai_v2_repo }}/archive/{{ site.kimai_v2_version }}.zip" class="btn btn-secondary"><i class="fas fa-download"></i> Verzija {{ site.kimai_v2_version }} (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/zipball/master" class="btn btn-secondary"><i class="fas fa-download"></i> Razvojna verzija (ZIP)</a>
<a href="{{ site.kimai_v2_repo }}/releases/tag/{{ site.kimai_v2_version }}" class="btn btn-secondary"><i class="fab fa-github"></i> Informacije izdanja {{ site.kimai_v2_version }} </a>
<a href="{{ site.kimai_v2_repo }}/releases" class="btn btn-secondary"><i class="fab fa-github"></i> Sva izdanja </a>

</div>
<div class="col-sm-12 col-lg-4">
    <div class="card card-md">
        <div class="card-body text-center">
            <h4>Kimai – Hosted</h4>
            <ul class="list-unstyled lh-lg">
                <li>
                    Besplatan TLS (SSL) certifikat
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Hosting i aktualiziranja
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Sigurnosne kopije
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Dodatak za prilagođena polja
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Dodatak za upravljanje zadacima
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Dodatak za troškove
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    Dodatak za dnevnik radnji
                    <i class="fas fa-check text-success"></i>
                </li>
                <li>
                    <br>
                    Besplatna tarifa je dostupna za <strong>5</strong> korisnika
                </li>
            </ul>
            <div class="text-center mt-4">
                <a href="https://www.kimai.cloud/pricing" class="btn btn-primary w-100">Odaberi tarifu</a>
            </div>
        </div>
    </div>
</div>
</div>

