---
title: "Sarah Moretti"
format: html
editor: visual
---

{r}
#| label: load-packages # nomes unicos
#| include: false # nao inclui o resultado no doc

library(tidyverse)
library(WDI)

# base de dados 

birthrateAUTSerieTemporal <- WDI(country = "AUT", 
                                 indicator = "SP.DYN.CBRT.IN", 
                                 start = 2000, 
                                 end = 2023)

birthrateDadosEmPainel <- WDI(country = "all", 
                              indicator = "SP.DYN.CBRT.IN", 
                              start = "1990", 
                              end = "2023")

birthrateCorteTransversal <- WDI(country = 'all', 
                                 indicator = 'SP.DYN.CBRT.IN', 
                                 start = '2021', 
                                 end = '2021')

VARIÁVEL

Falar sobre sua variável

GRÁFICO DADOS EM PAINEL

Falar sobre gráfico dados em painel

{r}
#| label: dadosempainel
#| warning: false
#| echo: false

ggplot(birthrateDadosEmPainel,
                     mapping = aes(y = SP.DYN.CBRT.IN,
                                   x = year)) +
  geom_point()

GRÁFICO SERIE TEMPORAL

Falar sobre gráfico serie temporal

{r} 
#| label: serietemporal 
#| warning: false 
#| echo: false  

ggplot(birthrateAUTSerieTemporal,
                     mapping = aes(y = SP.DYN.CBRT.IN,
                                   x = year)) +
  geom_point()


