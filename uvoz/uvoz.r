# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark=",", grouping_mark=".")



data <- read_csv2("podatki/tujci.namen.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...", "z") ) %>%
  rename(drzava=`DRŽAVA DRŽAVLJANSTVA`) %>%
  gather(key="leto.namen", value="stevilo", -drzava) %>%
  separate(leto.namen, c("leto", "namen"), "(?<=[0-9]) ") %>%
  mutate(leto=parse_number(leto))


data1 <- read_csv2("podatki/ods_st_akt.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...") )
  colnames(data1)[2] <- "drzava.prihodnjega.bivalisca" %>%
  gather(key="leto.status", value="stevilo", -drzava.prihodnjega.bivalisca) %>%
  separate(leto.status, c("leto","status"), "(?<=[0-9]) ") %>%
  mutate(leto=parse_number(leto))

data2 <- read_csv2("podatki/notranje.selitve.csv",locale=locale(encoding="Windows-1250"), skip = 2,  na=c("", "..."))
    colnames(data2)[1] <- "regija" %>%
    gather(key="leto.regija", value="stevilo", -regija) %>%
    separate(leto.regijav, c("leto", "regijav"), "(?<=[0-9]) ") %>%
    mutate(leto=parse_number(leto))


data3 <- read_csv2("podatki/pris.odselj.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...")) 
      rename(drzava = `DRŽAVA DRŽAVLJANSTVA`) 
      #gather(key = "leto.spol", value = "stevilo", -drzava) %>%
      #separate(leto.spol, c("leto", "spol"), "(?<=[0-9]) ") %>%
      #mutate(leto=parse_number(leto))








# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
