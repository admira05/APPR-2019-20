# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark=",", grouping_mark=".")



data <- read_csv2("podatki/tujci.namen.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...", "z") ) %>%
  rename(drzava=`DRŽAVA DRŽAVLJANSTVA`) %>%
  gather(key="leto.razlog", value="stevilo", -drzava) %>%
  separate(leto.razlog, c("leto", "razlog"), "(?<=[0-9]) ") %>%
  mutate(leto=parse_number(leto))
#colnames(data)[1] <- "drzava"

data1 <- read_csv2("podatki/ods_st_akt.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...") )

data2 <- read_csv2("podatki/notranje.selitve.csv",locale=locale(encoding="Windows-1250"), skip = 2,  na=c("", "..."))

data3 <- read_csv2("podatki/pris.odselj.csv",locale=locale(encoding="Windows-1250"), skip = 2, na=c("", "...") )


a <- gather(data,-drzava, key = leto_namen, value = stevilo)






# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
