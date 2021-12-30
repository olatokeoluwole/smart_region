getwd()
setwd('C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/scraped data')


library(rvest)
library(tidyverse)


## Birth, rates of non-financial enterprises %
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825771"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[7:359,]


values <- select(table,1:20)
values <- values[733:1085,]
values <- values[ ,c('X20','X19','X18','X17','X16','X15','X14','X13','X12','X11','X10','X9','X8','X7','X6','X5','X4','X3','X2','X1')]
colnames <- paste('',2028:20,sep = "")
names(values) <- colnames


data_startups <- cbind(names,values)
write.csv(data_startups,"data_startups.csv")

## Unemployment registered total of resident population aged 15 to 64 (%)

url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825764 "
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]



values <- select(table,1:20)
values <- values[733:1085,]
values <- values[ ,c('X20','X19','X18','X17','X16','X15','X14','X13','X12','X11','X10','X9','X8','X7','X6','X5','X4','X3','X2','X1')]
colnames <- paste('',2020:20,sep = "")
names(values) <- colnames


data_unemployment <- cbind(names,values)

g <- gather(data_unemployment,"year", "municipality", 2:21)
head(g)
write.csv(data_unemployment,"data_unemployment.csv")

## Purchasing power per capita (%)
url <- "https://www.pordata.pt/DB/Municipios/Ambiente+de+Consulta/Tabela/5825765 "
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]


values <- select(table,1:20)
values <- values[733:1085,]
values <- values[ ,c('X20','X19','X18','X17','X16','X15','X14','X13','X12','X11','X10','X9','X8','X7','X6','X5','X4','X3','X2','X1')]
colnames <- paste('',2020:20,sep = "")
names(values) <- colnames

data_purchasepower <- cbind(names,values)
write.csv(data_purchasepower,"data_purchasepower.csv")


## Expenditure (R&D) as a % of GDP
## https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825766 


## Individuals of 16 or over that use computers and Internet as a % of total of individuals
## https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825767

## Private households with internet access and with broadband internet access (%)
## https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825768


## Inhabitants per ATM machine
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825772"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[5:357,]

values <- select(table,1:20)
values <- values[733:1085,]
data_inhabitant_ATM <- cbind(names,values)
write.csv(data_inhabitant_ATM,"data_inhabitant_ATM.csv")

## Urban waste collection per inhabitant
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825774"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[5:357,]

values <- select(table,1:20)
values <- values[732:1084,]
data_waste <- cbind(names,values)
write.csv(data_waste,"data_waste.csv")

## Dwellings connected to public water supply systems (%)
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825773 "
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]



values <- select(table,1:20)
values <- values[734:1086,]

data_publicwater <- cbind(names,values)
write.csv(data_publicwater,"data_publicwater.csv")

## Electricity consumers
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825781"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]


values <- select(table,1:20)
values <- values[737:1089,]

data_electricity_consumers <- cbind(names,values)
write.csv(data_electricity_consumers,"data_electricity_consumers.csv")

## Computers with Internet connection as a % of total computers in primary
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825770"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]


values <- select(table,1:20)
values <- values[738:1090,]

data_prysch <- cbind(names,values)
write.csv(data_prysch,"data_prysch.csv")

## Electricity consumption: total
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825782"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]


values <- select(table,1:20)
values <- values[738:1090,]

data_electricity_consumption <- cbind(names,values)
write.csv(data_electricity_consumption,"data_electricity_consumption.csv")

##########################################################################
#how do i scrape ine


url <- "https://www.ine.pt/xportal/xmain?xpid=INE&xpgid=ine_indicadores&indOcorrCod=0010353&contexto=bd&selTab=tab2"
content <- read_html(url)
content
tables <- content %>% html_table()
length(tables)


ine <-read_html(url)
ine %>% html_nodes("iframe") %>% html_text()
