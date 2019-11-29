# Analiza podatkov s programom R, 2019/20

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2019/20

* [![Shiny](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/admira05/APPR-2019-20/master?urlpath=shiny/APPR-2019-20/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/admira05/APPR-2019-20/master?urlpath=rstudio) RStudio

## Tematika

V projektu bom analizirala preseljevanje Slovencev od leta 2000 do 2018. Predstavila bom meddržavne in regijske selitve glede na spol, potem bom analizirala tudi preseljevanje glede na starost in namen. Podatke sem pridobila na SURS-u.

Uporabila bom 5.tabel:

1.TABELA: Preseljevanje znotraj Slovenije oz. po kohezijskih regijah 
* stolpec 1: letnice
          2. stolpec: regije
          3. stolpec: spol
          4. stolpec: število ljudi, ki se je vselilo v to regijo
          5. stolpec: število ljudi, ki se je odselilo iz te regije
          
2.TABELA: Meddržavne selitve(priseljevanje v Slovenijo)
          1. stolpec: letnice
          2. stolpec: država predhodnega bivališča
          3. stolpec: spol
          4. stolpec: število ljudi, ki se je preselilo v Slovenijo
          
3.TABELA: Meddržavne selitve(odseljevanje iz Slovenije)
          Enaka tabela kot zgornja, le da so podatki po odseljevanju. 
          
4.TABELA: Meddržavne selitve glede na namen selitve
          Cilj te tabele je predstaviti različne namene priseljevanja v Slovenijo (zaposlitev,             sezonsko delo, združitev z družino, študij, drugo)
          1. stolpec: letnice
          2. stolpec: država predhodnega bivališča
          4. stolpec: starostna omejitev
          5. stolpec: namen selitve
          6. stolpec: vrednost
          
5.TABELA: Meddržavne selitve glede na namen selitve 
          Enaka tabela kot zgoraj, le da so podatki o različnih namenih prebivalstva, ki se                odseljuje iz Slovenije.



## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `tidyr` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
