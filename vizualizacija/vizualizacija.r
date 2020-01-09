# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
                             pot.zemljevida="OB", encoding="Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
zemljevid <- fortify(zemljevid)

# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))

stevilo.po.letih <- data %>% group_by(leto) %>% summarise(Stevilo=sum(stevilo, na.rm = TRUE))
 
#Graf po stevilu priseljenih po letih                               
graf1 <- ggplot(stevilo.po.letih) + aes(x = leto, y = Stevilo) + 
  geom_bar(stat = 'identity',position = 'dodge', fill = "darkcyan") + 
  xlab("Leto") + ylab("Število") + ggtitle("Število priseljenih glede na leto") 
graf1

#Graf po stevilu priseljenih po namenu
stevilo.po.namenu <- data %>% group_by(namen) %>% summarise(Stevilo=sum(stevilo, na.rm = TRUE))
graf2 <- ggplot(stevilo.po.namenu) + aes(x = namen, y = Stevilo) + 
  geom_bar(stat = 'identity',position = 'dodge', fill = "darksalmon") + 
  xlab("Leto") + ylab("Namen") + ggtitle("Število priseljenih glede na namen") 

